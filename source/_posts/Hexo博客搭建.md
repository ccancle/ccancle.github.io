---
title: Hexo博客搭建
date: 2020-02-14 18:55:02
tags:
- "Hexo"
- "工具使用"
categories:
- "Hexo"
- "Next"
---
## 前言

整理一下博客建站的工序：使用 **<font color =#FF4500>Hexo + Github Pages</font>**    
Hexo是一个快速高效的博客框架，可以使用Markdown解析文章 可以使用近三百种主题生成静态网页   
这里博客网站搭建使用的是把个人博客托管到GitHub Pages上。Github Pages是一种静态站点托管服务 每个Github账户都能有属于自己的站点。
<!--more-->
---------
## 环境准备
安装Hexo进行搭建博客前要先安装:

* Node.js
* Git  

检查安装：   
```
node -v # 是否出现安装版本信息 出现说明安装成功   
git --version # 是否出现安装版本信息，出现说明已经安装了
```
--------
## Hexo 介绍
我们知道在Github Pages存放的都是些渲染完成静态文件   
但是博客存放的不只是文章内容，还有文章分类，标签，列表等动态网站的内容   
如果每次写完博客之后都要更新博文目录列表和相关的信息，会很麻烦，因为想要让自己博客显示出来的仅仅只有其中的内容   
Hexo做到就是将写好的md文件原件存放到本地文件夹，每次写完博客后框架会批量生成相关页面文件，我们只要把生成的静态文件和图片等资料上传到github上提交就可以了

>但是如果牵扯到本地文件丢失或者更换电脑维护博客这种情况 Hexo这种提交方式就会很让人头疼，牵扯到备份原件和博客站点配置信息等东西，

如何备份Hexo博客？详见：   
[备份Hexo博客](https://www.macchac.com/2020/02/15/%E5%A4%87%E4%BB%BDHexo%E5%8D%9A%E5%AE%A2/)


>PS:之后的Hexo命令使用 **<font color =#FF4500> Git Bash</font>** 来执行 并且Hexo命令都需要在站点目录下进行

----------
## 搭建博客
>使用 Github Pages 搭建    
PS:当然首先你得有个Github”交友平台”的账户

### Github创建仓库
新建一个名为 **<font color =#FF4500><GitHub用户名>.github.io</font>** 的仓库,比如说我的Github用户名是 **<font color =#FF4500>ccancle</font>** ,我新建的仓库名字就是 **<font color =#FF4500>ccancle.github.io </font>** , 同样将来你的网站访问的默认地址就是https://ccancle.github.io

看域名就知道：每个Github账户最多只能创建一个这样可以直接使用域名访问的仓库，所以如果原来已经创建过这样的仓库，先把之前的给改名之后再创建这样的仓库

* 重点：仓库的名字必须是 **<font color =#FF4500><GitHub用户名>.github.io</font>**  ，其中username是你自己的用户名

### Hexo安装
```
$ npm install -g hexo
```
### Hexo初始化
在本地创建一个文件夹(路径随意 名字随意)当做本地博客文件夹用来存放hexo博客源文件 比如我的文件夹名为  **<font color =#FF4500>maccha</font>** 路径是： **<font color =#FF4500> D:\maccha</font>**
```
$ cd /d/maccha/
$ hexo init
```
输入上述命令之后 hexo会自动下载一些文件到这个目录下 生成自己的框架目录结构 其中重要的文件的目录结构如下：
```
├─scaffolds
├─package.json
├─_config.yml
├─source
|   ├─_posts
├─themes
```
PS：Hexo文件夹下有两个 **<font color =#FF4500>_config.yml</font>** 文件

1. 是站点根目录下的 **<font color =#FF4500>_config.yml</font>** 文件 用于设置博客整体配置信息
1. 是theme(主题)文件夹下的  **<font color =#FF4500>_config.yml</font>** 用于设置个性化主题配置

博客生成，测试预览命令：
```
$ hexo g # 生成
$ hexo server # 启动本地服务
```

执行上面的命令之后 Hexo会在 **<font color =#FF4500>public</font>** 文件夹下生成相关的html静态文件 这个就是你博客之后需要上传到Github上的网页静态文件   
``hexo s``是启动本地服务进行预览 之后在浏览器中访问 **http://localhost:4000** 即可返回页面预览 默认端口是4000


### 修改主题
Hexo默认的主题是landscape   
除此之外Hexo里面有很多个性化的主题 比如我使用的就是 Next 主题   
更多主题详见：https://github.com/search?q=hexo-theme   
**应用主题**

* 下载好主题
* 将下载的主题文件夹 粘贴到站点目录的 **<font color =#FF4500>theme</font>** 文件夹下
* 更改站点配置文件(根目录下的 **<font color =#FF4500>_config.yml</font>**  )的theme字段为主题名

```
+ theme: next
- theme: landscape
```
之后执行``hexo g``来生成博客   
``hexo server``可以进行预览效果
### 使用Github进行线上部署
本地博客搭建完成之后 下面的操作是把博客发布，部署到Github上：   
**添加SSH key**   
* 创建一个SSH key 在 **<font color =#FF4500> Git Bash</font>**  中使用以下命令 敲三下回车
```
$ ssh-keygen -t rsa -C "邮箱地址"
```
* 复制生成的密钥文件内容到Github中：（文件路径为：  **<font color =#FF4500>C:\Users\Administrator.ssh\id_rsa.pub </font>**）粘贴到[New SSH key](https://github.com/settings/keys)处即可
* 测试是否增加成功 可以使用下面命令 如果返回 “You’ve successfully authenticated” 说明添加成功
```
$ ssh -T git@github.com
$ yes
```

**修改<font color =#FF4500>_config.yml</font> （在站点目录下）。文件中deploy项修改为：**
```
deploy:
  type: git
  repo: git@github.com:<Github账号名称>/<Github账号名称>.github.io.git
  branch: master
```
>PS：上面仓库地址写ssh地址 不要写http地址

**安装``hexo-deployer-git``插件 使用下面命令：**
```
$ npm install hexo-deployer-git --save
$ hexo g # 生成
$ hexo d # 发布
```
就会把本次有改动的代码全部提交   
至此，您的Hexo博客已经搭建在GithubPages, 域名为 **<font color =#FF4500>https://<Github账号名称>.github.io</font>**

## 添加域名(可选)
在上面一个的基础上添加你所购买的自定义域名   
* **域名解析** (随意选 我使用的是腾讯云)   
记录类型选择CNAME   
主机记录填www

* 记录值就写你的博客仓库名称： **<font color =#FF4500><Github账号名称>.github.io</font>**    
解析路线 TTL默认即可
* 博客仓库的设置   
在 **<font color =#FF4500>Custom domain</font>** 下 填写自定义域名 点击save   
在站点的 **<font color =#FF4500>source</font>** 文件夹下，创建一个CNAME文件(无后缀名)，并写入你的域名
* 等待10分钟左右即可

之后自定义域名和 **<font color =#FF4500>https://<Github账号名称>.github.io</font>** 都可以访问你的博客网站
## 附录
Hexo常用命令等
### 常用命令   
```
$ hexo new "postName"        # 新建文章
$ hexo new page "pageName"   # 新建页面
$ hexo generate              # 生成静态网页到public目录
$ hexo server                # 启动本地预览访问端口(默认端口4000 使用Ctrl+C 关闭)
$ hexo deploy                # 发布到Github
$ hexo help                  # 查看帮助
$ hexo version               # 查看版本
```
### 常用组合命令
```
$ hexo g -s                  # 生成并本地预览
$ hexo g -d                  # 生成并发布博客
```
### 常用操作
如果不改博客配置 默认情况下生成的博客目录会限时全部文章内容，   
主页就会显得很乱 我们在文章的合理位置(比如每个文章写个摘要概述)后面加上  **<font color =#FF4500> <!–-more-–> </font>** 来设置文章的摘要   
这样 每篇文章在首页就可以只显示摘要内容了
```
这是一篇文章的摘要部分
<!--more-->
这是文章正文部分
```
