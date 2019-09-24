# FreeStreamer源码学习

1. stream_configuration  stream相关配置

2. id3_parser id3数据解析

ID3_Parser 对外暴露的类，主要工作由 ID3_Parser_Private类完成
ID3_Parser_Private 完成 id3 数据的解析工作
ID3_Parser_Delegate 抽象类，有两个纯虚函数


3. input_stream 抽象类
class Input_Stream : public ID3_Parser_Delegate { ... }