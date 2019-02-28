---
layout:     post
title:      iOS性能优化之AutoreleasePool
subtitle:   autoreleasePool的使用
date:       2019-02-23
author:     李鲁宾
header-img: img/post-bg-ios9-web.jpg
catalog: true
tags:
    - iOS性能优化
    - autoreleasepool
    - arc
---

#iOS性能优化之AutoreleasePool

对于ARC开发，很少会用到AutoreleasePool，但是，并不是说，ARC条件下开发就不需要使用AutoreleasePool。ARC环境下，系统会默认给每一个Runloop添加autoreleasepool，并不需要我们自己添加，这个过程中分配的所有变量，也会在runloop结束后，autoreleasepool会自动销毁，线程池中的变量也会自动释放。正常情况下是不会出现什么问题的，试想如果存在这样一种情况，某个线程runloop一直存在，并且在不停的分配新的变量，所有的变量就会一直堆积在内存中，来不及释放。
项目中，在录音功能的实现中，需要不停的进行录音数据的回调，而且速度极快，导致变量来不及释放，从而使的内存一直增加。我们可以做个小实验来验证这种情况。
程序会在一个事件周期的开始创建一个自动释放池，将产生的临时变量放进去，在事件周期结束再释放，由于一个while的事件周期没结束，所以会不停的向这个自动释放池里添加，导致内存一直增长。

```
- (void)funcNonAutoreleasePool {
    for (int i = 0; i < 100000; i++) {
        NSString *str = [NSString stringWithFormat:@"abcdefghijklmn%d ", i];  //2
        NSLog(@"%s:%i", __FUNCTION__, i);
    }

}

-(void)funcAutoreleasePool {
        for (int i = 0; i < 100000; i++) {
        @autoreleasepool {
            NSString *str = [NSString stringWithFormat:@"abcdefghijklmn%d ", i];  //2
            NSLog(@"%s:%i", __FUNCTION__, i);
        }
    }

}
```

上面两个函数， *funcNonAutoreleasePool*会导致内存疯狂增加，知道while循环结束。而如果添加了*@autoreleasepool*，内存就很平稳，没有任何增加。这就是说，分配的变量一直堆积在内存中，来不及释放，导致内存一直增加。添加了自动释放池之后，每一次循环结束，自动释放池中的变量都会释放，内存不会出现上涨。

通过Allocations的MarkGeneration，发现增长的变量中，有一种叫做*autoreleasepool content*，怀疑是构成autoreleasepool的page，autoreleasepool是由很多个autoreleasepool page以链表的形式构成的，每一个添加到autoreleasepool中的变量，其实都是添加到autolreleasepool page中，由于变量一直堆积，导致page也一直增加。

对于*funcNonAutoreleasePool*，如果将其改成如下形式，就不会出现内存增长。
```
- (void)funcNonAutoreleasePool {
    for (int i = 0; i < 100000; i++) {
        NSString *str = [NSString stringWithFormat:@"abcde "];  //2
        NSLog(@"%s:%i", __FUNCTION__, i);
    }

}
```
原因就在于NSTaggedPointerString。


