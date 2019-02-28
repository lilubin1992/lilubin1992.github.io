---
layout:     post
title:      atomic与nonatomic对比
subtitle:   
date:       2019-02-26
author:     李鲁宾
header-img: img/post-bg-mma-2.jpg
catalog: true
tags:
    - atomic
    - nonatomic
    - property
---

atomic和nonatomic是常用的属性关键字，平常用nonatomic用的比较多，atomic很少用。

atomic是多线程中的一个概念，如果不涉及多线程的操作，不需要设置成atomic。

atomic和nonatomic的区别在于系统自动生成的getter/setter方法不一样。如果自己实现getter/setter，那么这些关键字写不写都一样。

对于atomic属性，系统生成的getter/setter会保证get,set操作的完整性，不受其他线程影响（原子性）。而nonatomic没有这个保证，所以，nonatomic速度要比atomic快。

属性声明时，默认是atomic属性。


官方文档给出的解释：[Atomicity](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjectiveC/Chapters/ocProperties.html)
    You can use this attribute to specify that accessor methods are not atomic.

nonatomic
    Specifies that accessors are nonatomic. By default, accessors are atomic.
Properties are atomic by default so that synthesized accessors provide robust access to properties in a multithreaded environment—that is, the value returned from the getter or set via the setter is always fully retrieved or set regardless of what other threads are executing concurrently.

If you specify strong, copy, or retain and do not specify nonatomic, then in a reference-counted environment, a synthesized get accessor for an object property uses a lock and retains and autoreleases the returned value—the implementation will be similar to the following:

```
[_internal lock]; // lock using an object-level lock
id result = [[value retain] autorelease];
[_internal unlock];
return result;
```

代码示例
```
@property (nonatomic, string) NSString *target;
```

```
    dispatch_queue_t queue = dispatch_queue_create("parallel", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 1000000 ; i++) {
        dispatch_async(queue, ^{
            self.target = [NSString stringWithFormat:@"ksddkjalkjd%d",i];
        });
    }

```

当*target*的属性为*nonatomic*时，会导致崩溃，为*atomic*不会崩溃。