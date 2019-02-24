---
layout:     post
title:      iOS性能优化之Instruments的使用
subtitle:   Leaks, Allocations, Time Profiler, 
date:       2019-02-21
author:     李鲁宾
header-img: img/post-bg-debug.png
catalog: true
tags:
    - iOS性能优化
    - Instruments
    - Allocations
    - 内存优化
    - Leaks
    - Time Profiler
---

# iOS性能优化-Instruments的使用

iOS开发中，Instruments是不可或缺的工具。前段时间遇到几个性能问题，花费了好久通过使用Instruments找到解决方案。

### 使用Instruments检测内存问题，一定要使用真机调试，不可以使用模拟器，因为模拟器使用的是mac的x86架构的cpu，iphone使用的是arm64架构的cpu，有些内存分配，比如NSTaggedPointerString，以及处理能力上，相差很多，很多内存问题，使用模拟器无法出现。

## 遇到的性能问题
1. 界面卡顿。
2. cpu暴涨，超过100%。
3. 内存暴涨，每秒增加3M左右。

### 整个问题的解决思路
    
对于界面卡顿，一定是主线程的问题，这点必须明确，否则会走很多弯路。刚开始，我以为是数据处理不过来导致，其实最终原因是日志打印一直在主线程刷新，而且频率很快，导致前端界面卡顿严重。另外，如果cpu占有率过高，会导致手机发烫，进而导致界面卡顿。



### 内存问题排查， Leaks， Allocations的使用
内存暴涨，有两个原因，1.内存泄漏，2.一直在创建对象，并且没有机会被释放，导致内存对象一直堆积。

#### Leaks的使用
Leaks主要是用来测试内存泄漏，测试过程中如果有红色叉叉❌出现，说明有新的内存泄漏。左下角面板展示的是具体泄漏的内存，点击某个泄漏，右下角面板会显示出这个泄漏具体是在什么代码中泄漏的。
    
![](https://ws2.sinaimg.cn/large/006tKfTcly1g0hf97xfiej31dx0u0wwg.jpg)

由于现在iOS开发中都是使用的ARC，很少会出现内存泄漏的情况。我遇到的问题，使用leaks也没检测到内存泄漏，但是内存还是增长的很快。

#### Allocations的使用
对于第二种情况，就需要使用Allocations来排查具体是什么原因导致的内存增加。

![](https://ws2.sinaimg.cn/large/006tKfTcly1g0hp2i25q1j31dx0u0dyx.jpg)

通过*calltree*的*Separate by thread*可以看到每个线程所占有的内存，点击某个线程，右下角会显示该线程的具体每个方法都占有多少内存。图片左下角有一个*make generation*按钮，通过该按钮打点，可以看到具体某个时间段都增长了多少内存，已经这些内存分配的都是什么。

![](https://ws2.sinaimg.cn/large/006tKfTcly1g0hp9qwn8nj31bn0u0q9w.jpg)

如图，红色框框里的就是相对应的这段时间内已经分配并且没有被释放的内存。点击具体某个分配的变量，可以看到这个变量是在那个方法中分配的。

可以看到，这段时间内，*CFString*和*autoreleasepool content*占有量很大，所以，解决这两个的分配问题，是解决这次性能问题的关键。将会在*性能优化之AutoreleasePool*和*性能优化之NSTaggedPointerString*中讲到。

由于项目中需要进行8个小时的压力测试，必须保证这段时间内的内存释放很及时，不能出现明显的内存增长的情况，所以，必须通过使用allocations工具长时间的进行检测内存使用情况。另外，连接instruments进行测试的话，可能会导致手机界面出现卡顿，这是因为mac需要和iPhone不停的进行通信，导致出现卡顿，可以不去在乎。

#### TimeProfiler的使用

如果app运行会导致手机发烫，那么，就是因为cpu使用率过高，cpu一直在高负荷运转，就会导致手机发烫。
项目需要实时采集音频数据，进行傅里叶转换，提取音频相关信息，并以动态频谱的方式展示在界面上。运行一段时间就会导致手机发烫，此时，通过TimeProfiler就可以检测具体是什么原因导致的cpu一直处于工作状态。

![](https://ws3.sinaimg.cn/large/006tKfTcly1g0hq32o5udj31bn0u0nce.jpg)

*TimeProfiler*的使用和*Allocations*的使用基本一直，通过查看具体某个线程的情况，进而查看是那个方法一直在占有cpu。

遇到性能问题，尽量使用Instruments来进行检查，避免盲目猜测导致走很多弯路。

    



