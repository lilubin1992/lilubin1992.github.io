---
layout:     post
title:      iOS录音方案对比AudioUnit&AudioQueue
subtitle:   auidoUnit auioQueue
date:       2019-02-21
author:     李鲁宾
header-img: img/post-bg-ioses.jpg
catalog: true
tags:
    - iOS录音
    - AudioUnit
    - AuidoQueue
---

#iOS录音方案对比AudioUnit&AudioQueue

首先介绍一下需要实现的效果，项目中只需要进行录制，将录制的pcm数据实时的传给音频转换的sdk，然后获取sdk转换后的数据，传给前端面板进行展示。所以，我们只需要能够实时获取麦克风的数据，不需要同时进行播放。通过调研，使用AudioUnit和AudioQueue都可以实现实时采集pcm数据的功能，刚开始采用的是AudioUnit的方案，因为AudioUnit的实时性更好，而且可扩展性比较好。
## AudioUnit & AudioQueue 对比

1. AudioQueue是对AudioUnit的更高一级的封装，AudioQueue能够进行的操作，AudioUnit也基本都可以实现。
2. 两者都可以实现录制，播放，暂停，回退，转换（PCM->AAC）等功能。
3. AudioQueue可以定制存储音频数据的回调buffer的大小，AudioUnit的存储音频数据的回调buffer的大小固定为1k。

刚开始采取的AudioUnit的方案，由于不可以定制buffer的大小，导致回调过于频繁，cpu压力很大。而采用AudioQueue的方案，可以指定buffer的大小，buffer越大，回调频率越低，cpu压力越小。以我们的项目为例，buffer大小为1k和2k的时候，cpu使用率相差15%左右。

AudioQueue的使用要比AudioUnit的使用简单的多，需要指定的参数也少很大。在保证产品质量的情况下，选择AudioQueue比AudioUnit要好很多。


