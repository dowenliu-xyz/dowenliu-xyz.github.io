---
layout: post
title: Ubuntu下转换flac文件为mp3
tags: [ubuntu, tools, 格式转换, flac, mp3]
description: 在Ubuntu下将flac格式音频为mp3格式
---
直接上代码，在Ubuntu下将flac格式音频为mp3格式
{%highlight bash%}
$ sudo apt-get install ffmpeg
$ ffmpeg -i "下川みくに - 残酷な天使のテーゼ.flac" -acodec libmp3lame -ab 320k "下川みくに - 残酷な天使のテーゼ.mp3"
{%endhighlight%}
