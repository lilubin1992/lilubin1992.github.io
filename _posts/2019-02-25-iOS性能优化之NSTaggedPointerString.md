---
layout:     post
title:      iOS性能优化之NSTaggedPointerString
subtitle:    NSTaggedPointerString
date:       2019-02-25
author:     李鲁宾
header-img: img/post-bg-ios10.jpg
catalog: true
tags:
    - iOS性能优化
    - NSTaggedPointerString
---

# iOS性能优化之NSTaggedPointerString

按照原有知识理解，变量的存储都是*指针+堆中内存*这种存储方式，即对于一个变量，其会有一个指针，而该指针指向的位置存储的值，才是这个变量的值。对于NSTaggedPointerString这种类型的变量，其指针中并不是真正的指针，而是一个伪指针，该指针中即存储着这个变量的值。

在iPhone 5s引入的过程中其实也引入了64位的处理器，而在引入64位处理器的过程中，指针所占的位数也相应的变为了64位(而在以前的32位处理器的时候指针都是以32位的形式存储)。而如果我需要创建一个NSNumber的实例，则我需要一个8个字节(64位)的指针以及在堆中分配一定空间来进行存储(大概是在8字节左右)。也就是说我需要16个字节才能存储一个NSNumber的对象。而对于一个4个字节的存储空间来说以及可以存储20+亿的整数了。

这个时候Tagged Pointer就闪亮登场了。它的目的就在于，当处于64位处理器的系统中将所有信息都存在栈的指针中，并通过一定的的特殊标记位来说明该指针为一个Tagged Pointer，剩余的一些指针的位数则用来存储NSNumber的具体数值。

其实这么做除了能节省CPU的空间以外，还能提高处理NSNumber的速度，因为他不需要再从堆中申请和释放空间，同时在读取和存储上的速度也加快了。

iOS中，NSNumber，NSString，NSDate都可以以这种形式进行存储。NSDate以这种形式来存储暂时没有找到实例。

![](https://ws3.sinaimg.cn/large/006tKfTcly1g0iigp6460j31560joafq.jpg)

其中，最高4位和最低4位分别有特殊含义。




