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
之后会弹出无标题Dialog，直接点击`Update Names`按钮，恩，还没完，还有下一步：
{% highlight bash %}
$ export LANG=zh_CN.UTF-8
$ xdg-user-dirs-gtk-update
{% endhighlight%}
这次又弹出了之前的Dialog汉语版，选中`不要再次询问我`再点击`保留旧的名称`，以后就都是英文文件夹名了。

## VIM
这个必装，我不是VI/VIM高手，只会一点基本操作，但之后修改配置文件都要靠它。我不建议使用Gedit，那玩意总是留下一些临时文件（如果是用sudo的情况下，所有权是root...)
{% highlight bash %}
$ sudo apt-get install vim
{% endhighlight %}

## 修改Terminal提示符格式
在`~/.bashrc`文件末尾加入如下内容(我也是从网上借鉴的，Ubuntu终端默认展示完成路经太痛苦了，这点RedHat/CentOS就好多了):
{% highlight bash %}
export PS1='\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u\[\033[01;33m\]@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$ '
{% endhighlight%}
修改后terminal效果如下（请自动忽略背景透明效果）
![terminal_01]({{site.baseurl}}/images/2016/01/ubuntu-dev-environment-installation/terminal_01.png){:.center-image}

## 修改主apt源

之前在大学折腾Ubuntu的时候比较喜欢用sohu、cn99或者台湾的源，之后有了阿里云的镜像之后就一直固定使用阿里的源了。需要注意的是要把`/etc/apt/sources.list`文件中`security.ubuntu.com`的部分也换成`mirrors.aliyun.com`，不然每次更新还是要到地球另一端去……  
附修改后的[sources.list]({{site.baseurl}}/attach/2016/01/ubuntu-dev-environment-installation/sources.list)

## 安装常用字体
{% highlight bash %}
$ sudo apt-get install ttf-wqy-* ttf-telugu-fonts ttf-oriya-fonts ttf-kannada-fonts ttf-bengali-fonts ttf-dejavu-extra ttf-dejavu ttf-xfree86-nonfree ttf-mscorefonts-installer ttf-baekmuk fonts-unfonts-extra fonts-unfonts-core ttf-kochi-gothic ttf-kochi-mincho
{% endhighlight%}

## Chromium浏览器
Web开发必备，个人觉得比FireFox好用。
{% highlight bash %}
$ sudo apt-get install chromium-browser chromium-codecs-ffmpeg-extra unity-chromium-extension
{% endhighlight%}
开发用扩展列表（自行科学上网...）：
  * [Anything to QRcode](https://chrome.google.com/webstore/detail/anything-to-qrcode/calkaljlpglgogjfcidhlmmlgjnpmnmf)：生成二维码，方便将URL传给手机分发。
  * [Cache Killer](https://chrome.google.com/webstore/detail/cache-killer/jpfbieopdmepaolggioebjmedmclkbap)：禁用缓存
  * [Check My Links](https://chrome.google.com/webstore/detail/check-my-links/ojkcdipcgfaekbeaelaapakgnjflfglf)：检查死链
  * [DHC - REST/HTTP API Client](https://chrome.google.com/webstore/detail/dhc-resthttp-api-client/aejoelaoggembcahagimdiliamlcdmfm)：如名称所示，REST/HTTP API调用工具
  * [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop)：DHC的替代者，视图友好，支持同步
  * [JSON Editor](https://chrome.google.com/webstore/detail/json-editor/lhkmoheomjbkfloacpgllgjcamhihfaj)：JSON查看、格式化、编译工具
  * [JSON Formatter](https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa)：JSON响应格式化，支持折叠，相比[JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)的优点是支持JsonArray折叠后元素个数显示，但是没有多主题配色支持。
  * [PDF Viewer](https://chrome.google.com/webstore/detail/pdf-viewer/oemmndcbldboiebfnladdacbdfmadadm)：PDF阅读器，比Ubuntu自带的文档查看器evince好用一点，但感觉都没有Win上Adobe ReaderX或者福欣阅读器好用。
  * [Proxy SwitchySharp](https://chrome.google.com/webstore/detail/proxy-switchysharp/dpplabbmogkhghncfbfdeeokoefdjegm)：配合SS，科学上网必备
  * [RegExp Tester App](https://chrome.google.com/webstore/detail/regexp-tester-app/cmmblmkfaijaadfjapjddbeaoffeccib)：正则表达式测试，装上就基本没用过，就不瞎评价误导大家了
  * [User-Agent Switcher](https://chrome.google.com/webstore/detail/user-agent-switcher/ffhkkpnppgnfaobgihpdblnhmmbodake)：UA切换，不只开发可以用，还可以切成Safari on IPad上土豆看视频（我没装那个老是曝出各种安全问题的FlashPlayer）
  * [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)：键盘党福利，无鼠标控制网页

## Fcitx
我现在用的Ubuntu版本是15.10，自带输入法框架已经是Fcitx了，估计以后的版本也不会换了。如果你的Ubuntu带的是iBus……要么再见，要么自行Baidu/Google。
安装五笔输入法（我习惯五笔，大家自便）
{% highlight bash %}
$ sudo apt-get install fcitx-table-wbpy
{% endhighlight%}
重启Fcitx后增加五笔拼音输入法。为了配合IntelliJ IDEA繁多的快捷键，需要把Fcitx中多数快捷键取消，只保留：
  * 全局配置(显示高级选项) -> 快捷键：
    * 切换激活/非激活输入法 Ctrl+Space
    * 额外的激活输入法快捷键 左Shift
    * 输入法切换键 Ctrl+Shift
    * 切换全角标点 Ctrl+.
    * 上一页 - Up
    * 下一页 = Down

## exFat格式文件系统支持
Linux对Win NTFS的支持还是不完善，写入的文件会产生不少的不可移动的文件碎片，所以我的移动硬盘格式化为exFat格式了，现在应该基本不会接触到老旧XP的机器，也不就不考虑和XP环境交换数据的问题了。
Ubuntu下对exFat文件系统支持：
{% highlight bash %}
$ sudo apt-get install exfat-fuse
{% endhighlight%}

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

## Ant
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

## Maven
Maven我也是使用的Ubuntu源中的版本。
{% highlight bash %}
$ sudo apt-get install maven
$ mvn -v
Apache Maven 3.3.3
Maven home: /usr/share/maven
Java version: 1.8.0_66, vendor: Oracle Corporation
Java home: /usr/lib/jvm/java-8-oracle/jre
Default locale: zh_CN, platform encoding: UTF-8
OS name: "linux", version: "4.2.0-22-generic", arch: "amd64", family: "unix"
{% endhighlight%}
安装完svn后最好安装下nexus代理服务器，nexus代理服务器的配置这里就不讲了，超出了本文的范畴。
之后配置用户全局配置`~/.m2/settings.xml`，参考[我的settings]({{site.baseurl}}/attach/2016/01/settings.xml)

## Subversion
恩，还是喜欢用git，不过公司用SVN，还是得装。
{% highlight bash %}
$ sudo apt-get install subversion
{% endhighlight%}
如果要用Eclips SVN插件还得装下libsvn-java
{% highlight bash %}
$ sudo apt-get install libsvn-java
{% endhighlight%}
使用ln建立链接，不然插件还是会报错：
{% highlight bash %}
$ sudo mkdir -P /usr/java/packages/lib/amd64/ #我这是64位系统，32位的应该是x86吧
$ sudo ln -s /usr/lib/x86_64-linux-gnu/jni/libsvnjavahl-1.so.0.0.0 /usr/java/packages/lib/amd64/libsvnjavahl-1
$ sudo ln -s /usr/lib/x86_64-linux-gnu/jni/libsvnjavahl-1.so.0.0.0 /usr/java/packages/lib/amd64/libsvnjavahl-1.so
{% endhighlight%}
svn的GUI工具，我用的是RapidSVN（话说也没有啥更好用一点点的GUI工具了，凑合用吧）
{% highlight bash %}
$ sudo apt-get install rapidsvn
{% endhighlight%}

## git
{% highlight bash %}
$ sudo apt-get install git git-doc
{% endhighlight%}
GUI工具就算了，CLI工具已经够用了（我才不会告诉你IntelliJ IDEA里Git支持GUI……）

## Unison
说完SVN、Git，说一下这个文件同步工具。我平时使用git进行代码版本管理，虽然还有`git-svn`这样的工具方便同时使用git、svn但是在我常用的IDEA里同时使用两者会非常的混乱，所以用于svn提交的工作区和实际开发用的是不同的，本地提交到git、推送到GitLab后再用Unison把修改同步到svn工作区，再进行svn提交。另外，如果你自建了家庭主机+DDNS或者租了云主机，你也可以使用它进行远程同步！
{% highlight bash %}
$ sudo apt-get install unison unison-gtk
{% endhighlight%}
注：远程同步时非22端口ssh地址写法(需要手工修改配置，GUI配置的时候先只填用户+主机)：ssh://_user_@_host_:_port_/_remote_/_path_

## ssh
{% highlight bash %}
$ sudo apt-get install openssh-client openssh-server openssh-sftp-server
{% endhighlight%}

## OpenVPN
公司VPN使用的是OpenVPN搭建的，刚好Ubuntu可以支持：
{% highlight bash %}
$ sudo apt-get install network-manager-openvpn
{% endhighlight%}

## FileZilla
{% highlight bash %}
$ sudo apt-get install filezilla
{% endhighlight%}
如果是向测试/生产服务器部署上传的话，推荐scp命令，感觉比打开一个GUI程序上传操作快捷的多

## Geany
{% highlight bash %}
$ sudo apt-get install geany
{% endhighlight%}
很好用的编辑器，完全取代Gedit.

## 快盘
没有墙的话我比较推荐Dropbox/Copy/SpiderOak，速度虽然有点慢，但从来没丢过文件，可惜……  
快盘的话，一般文件同步不错，速度也挺快，只是工程文件不能放里面，它会把所有.svn/.git文件/文件夹送上西天……
{% highlight bash %}
$ echo "deb http://archive.ubuntukylin.com:10006/ubuntukylin trusty main"|sudo tee /etc/apt/sources.list.d/kuaipan.list
$ sudo apt-get update
$ sudo apt-get install kuaipan4uk
{% endhighlight%}

## Meld
相当于是图形化的diff吧，文本文件比较工具
{% highlight bash %}
$ sudo apt-get install meld
{% endhighlight%}
另外，Ubuntu的文件管理器Nautilus还可以通过安装nautilus-compare拓展支持在Nautilus中启动两文件/文件夹的比较
{% highlight bash %}
$ sudo apt-get install nautilus-compare
{% endhighlight%}

## MySQL
不多说，由于不需要在本地跑MySQL Server，只安装客户端
{% highlight bash %}
$ sudo apt-get install mysql-client
{% endhighlight%}
如果想安装最新版本，请安装MySQL官方源
另外，不少同事喜欢用Navicat来管理MySQL数据，其实MySQL官方出口的Workbench还是不错的，关键还是开源免费，安装之
{% highlight bash %}
$ sudo apt-get install mysql-workbench
{% endhighlight%}

## Nginx
作WEB开发，Nginx应该都挺熟悉，我本地就装了两套，一套APT安装，一套源码编译安装。  
APT安装
{% highlight bash %}
$ sudo apt-get install nginx
{% endhighlight%}
源码编译安装
{% highlight bash %}
$ wget http://nginx.org/download/nginx-1.8.0.tar.gz
$ tar xvzf nginx-1.8.0.tar.gz
$ cd nginx-1.8.0
$ ./configure --prefix=/opt/nginx-1.8.0-dist
$ make;make install
{% endhighlight%}
安装中可能因缺少依赖编译失败，解决方案自行Baidu/Google吧

## 其他项目用工具/服务
因公司项目需要，还需要安装一些工具/服务：

### Redis
Ubuntu APT源中的版本过旧，需要编译安装新版本
{% highlight bash %}
$ wget http://download.redis.io/releases/redis-3.0.6.tar.gz
$ tar xzf redis-3.0.6.tar.gz
$ cd redis-3.0.6
$ make
{% endhighlight%}
配置/Cluster配置等可以参考[Redis Documentation](http://redis.io/documentation)

### MongoDB
使用MongoDB官方文档中的方式安装即可，由于公司架设了服务集群，本地只安装客户端就OK了
{% highlight bash %}
$ echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
$ sudo apt-get update
$ sudo apt-get install mongodb-org-shell
{% endhighlight%}

## 一些配置

### 本地打开文件数限制解除
{% highlight bash %}
$ echo "fs.file-max = 819200" | sudo tee /etc/sysctl.d/60-fs-file-max.conf
$ echo "fs.inotify.max_user_watches = 524288" | sudo tee /etc/sysctl.d/60-fs-max-user-watches.conf
{% endhighlight%}

### ssh配置
去除GSSAPI登录认证，不常用却会增加登录等待时间。

## 其他非开发工具

### Tomboy
便签工具
{% highlight bash %}
$ sudo apt-get install tomboy
{% endhighlight%}

### 解压工具
Ubuntu自带了tar命令，通常还需要手工安装解压rar、zip格式文件的命令。解压rar有unrar工具。解压zip通常使用unzip工具，这里我推荐unar工具，可以解决win下创建的zip包解压乱码问题！
{% highlight bash %}
$ sudo apt-get install unrar unar
{% endhighlight%}

### Shutter
Ubuntu下，也可能是Linux下最好用的截图工具
{% highlight bash %}
$ sudo apt-get install shutter
{% endhighlight%}

### nethogs
各应用实时网速检查，需要sudo权限
{% highlight bash %}
$ sudo apt-get install nethogs
{% endhighlight%}

### indicator-multiload
综合负载指示器，可实时显示CPU使用率、内存占用、网速、负载、磁盘IO、交换空间等
{% highlight bash %}
$ sudo apt-get install indicator-multiload
{% endhighlight%}

### postfix
邮件发送服务器，有时会用到
{% highlight bash %}
$ sudo apt-get install postfix
{% endhighlight%}

### VirtaulBox
大名鼎鼎的开源虚拟机。公司OA只能用IE打开，多亏了VBOX我才能交上那么多加班和调休。
{% highlight bash %}
$ wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
$ echo "deb http://download.virtualbox.org/virtualbox/debian wily contrib" | sudo tee /etc/apt/sources.list.d/virtualbox-wily.list
$ sudo apt-get update
$ sudo apt-get install dkms virtualbox virtualbox-dkms virtualbox-guest-additions-iso
$ sudo usermod -a -G vboxusers username # 替换为自己的用户名，用于增加USB权限，需要重新登录
{% endhighlight%}

### Audacity
音频编辑工具
{% highlight bash %}
$ sudo apt-get install audacity
{% endhighlight%}

### VLC
媒体播放器
音频编辑工具
{% highlight bash %}
$ sudo apt-get install vlc
{% endhighlight%}

### 解码器
{% highlight bash %}
$ sudo apt-get install gstreamer0.10-fluendo-mp3 gstreamer0.10-plugins-bad gstreamer0.10-plugins-bad-multi gstreamer0.10-plugins-ugly gstreamer1.0-alsa gstreamer1.0-fluendo-mp3 gstreamer1.0-libav gstreamer1.0-plugins-bad gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-ugly
{% endhighlight%}

### GIMP
图像编辑
{% highlight bash %}
$ sudo apt-get install gimp gimp-data-extras
{% endhighlight%}

### 密码管理器
{% highlight bash %}
$ sudo apt-get install keepassx keepass2 # 这俩相互不兼容，推荐只安装keepassx就好了
{% endhighlight%}

### GParted
分区编辑器（需要sudo权限，小心使用！）
{% highlight bash %}
$ sudo apt-get install gparted
{% endhighlight%}

## 最后 --> shadowsocks
安装ppa
{% highlight bash %}
$ sudo add-apt-repository ppa:hzwhuang/ss-qt5
$ sudo apt-get update
{% endhighlight %}
安装
{% highlight bash %}
$ sudo apt-get install python-pip
$ sudo apt-get install python-m2crypto
$ sudo pip install pip
$ sudo pip install shadowsocks
$ sudo apt-get install shadowsocks-qt5
{% endhighlight %}
