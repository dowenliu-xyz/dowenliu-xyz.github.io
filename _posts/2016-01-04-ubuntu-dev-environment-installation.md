---
layout: post
title: Ubuntu工作环境搭建
tags: [ubuntu, tools]
description: 一直在Ubuntu下做Java开发，积累了不少好用的工具。使用Ubuntu和使用Win有点相同点：你总得一年里重装一两遍……Ubuntu下工具通常还是比较杂的，有GUI的还好，通常都能记住，有些CLI工具可能在重装的时候就给忘了的说，这里把我一直使用的工具列一下，之后再重装Ubuntu的时候直接来一项一项参考。当然写个shell脚本就更好了，奈何，使用Ubuntu的人也不尽是Linux高人啊……
---
在Ubuntu下做Java开发用了两年多了，积累了不少好用的工具。相比两年前使用Win开发，Ubuntu确实是要爽不少（系统不会越来越卡，没有各种广告弹窗，没有各种全家桶）。不过，使用Ubuntu和使用Win有点相同点：你总得一年里重装一两遍……Win是你不重装就卡死你，Ubuntu重装大抵要么是自己作死把系统搞乱了弄不回来，要么是发了新版本耐不住想要尝尝鲜。Ubuntu下使用的工具大多是开源工具，没有大厂商支持，所以Ubuntu下的工具通常比较杂，有GUI的还好，重装之前对着启动器截个图，重装后照着装就好，但是有些CLI工具可能在重装的时候就给忘了的说。这里把我一直使用的工具列一下，之后再重装Ubuntu的时候直接来一项一项参考。当然写个shell脚本就更好了，奈何，使用Ubuntu的人也不尽是Linux高人啊……

分区装系统这种我就不废话了——穿越时空之门——恩，现在你已经有一个Clean安装的Ubuntu系统了……

## 主目录文件夹

在中国，使用/开发软件就不得不面临语言的矛盾：想要尽快的得到信息，所以我希望展示使用的语言是我的母语zh_CN.UTF-8；想要较少的输入进行我想要的操作，所以不想切换输入法...可是可是可是！按中文语言装好的Ubuntu（英文好，使用英语语言安装的阶级敌人请自行下潜）建立的用户文件夹是：桌面、下载……下个tar.gz包然后用命令解析到指定位置……我去你X的输入法切换！  
怎么办？下面的操作可以切换：
{% highlight bash %}
$ export LANG=en_US
$ xdg-user-dirs-gtk-update
{% endhighlight%}
之后会弹出如下Dialog:![screenshot]({{site.baseurl}}/images/2016/01/ubuntu-dev-environment-installation/xdg-user-dirs-gtk-update-1.png){: .center-image }*第一次执行xdg-user-dirs-gtk-update*
直接点击`Update Names`按钮，恩，还没完，还有下一步：
{% highlight bash %}
$ export LANG=zh_CN.UTF-8
$ xdg-user-dirs-gtk-update
{% endhighlight%}
这次又弹出的Dialog:![screenshot]({{site.baseurl}}/images/2016/01/ubuntu-dev-environment-installation/xdg-user-dirs-gtk-update-2.png){: .center-image }*第二次执行xdg-user-dirs-gtk-update*
选中`不要再次询问我`再点击`保留旧的名称`，以后就都是英文文件夹名了。

## 修改主apt源

之前在大学折腾Ubuntu的时候比较喜欢用sohu、cn99或者台湾的源，之后有了阿里云的镜像之后就一直固定使用阿里的源了。需要注意的是要把`/etc/apt/sources.list`文件中`security.ubuntu.com`的部分也换成`mirrors.aliyun.com`，不然每次更新还是要到地球另一端去……  
附修改后的[sources.list]({{site.baseurl}}/attach/2016/01/ubuntu-dev-environment-installation/sources.list)

## Oracle JDK

Ubuntu官方源里的JDK是OpenJdk，为了保持与生产部署一致的编译环境，需要安装Oracle JDK（记得09年那会儿Ubuntu源里还有提供的）。  
前一年时我还是自己从Oracle网站下载tar.gz包解压、配置环境变量使用，现在则主要使用[WebUpd8](https://launchpad.net/~webupd8team)提供的[PPA](https://launchpad.net/~webupd8team/+archive/ubuntu/java)源，主要的好处是apt安装ant、maven不会再把OpenJdk这个亲戚也带进你的Ubuntu里了。
安装ppa
{% highlight bash %}
$ sudo add-apt-repository ppa:webupd8team/java
$ sudo apt-get update
{% endhighlight %}
安装Oracle Java 6/7/8
{% highlight bash %}
$ sudo apt-get install oracle-java6-installer oracle-java7-installer oracle-java8-installer
{% endhighlight %}
此时当前Java版本为jdk8，如果要切换：
{% highlight bash %}
$ sudo apt-get install oracle-java6-set-default # 切换为jdk6
$ sudo apt-get install oracle-java7-set-default # 切换为jdk7
$ sudo apt-get install oracle-java8-set-default # 切换为jdk8
{% endhighlight %}
WebUpd8的包已经为我们设置好了一批环境变量，不过没有设置`CLASSPATH`变量，在`/etc/profile.d`目录下建立`set_classpath.sh`并增加执行权限
{% highlight bash %}
$ cd /etc/profile.d
$ sudo touch set_classpath.sh
$ sudo chmod +x set_classpath.sh
{% endhighlight%}
在`set_classpath.sh`中录入如下内容
{% highlight bash %}
#!/bin/bash
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
{% endhighlight%}

## ant
说实话，我工作中基本不使用ant，因为只用maven就已经满足我的需求了，安装ant也只是有时构建代码需要。  
使用Ubuntu源中的ant就好，ant版本更新不快，apt源中的版本基本就是当前最新版本。
{% highlight bash %}
$ sudo apt-get install ant
{% endhighlight%}
之后配置ant环境变量
在`/etc/profile.d`目录下建立`ant_env.sh`并增加执行权限
{% highlight bash %}
$ cd /etc/profile.d
$ sudo touch ant_env.sh
$ sudo chmod +x ant_env.sh
{% endhighlight%}
在`ant_env.sh`中录入如下内容
{% highlight bash %}
#!/bin/bash
export ANT_HOME=/usr/share/ant
export PATH=$PATH:$ANT_HOME/bin
{% endhighlight%}
验证：
{% highlight bash %}
$ source /etc/profile.d/ant_env.sh
$ ant -version
Apache Ant(TM) version 1.9.6 compiled on July 8 2015
{% endhighlight%}

---------
下一篇再继续吧～
