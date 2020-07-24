# bililive-helper

一个用于 Bilibili 直播的 Hammerspoon 小工具，可以查看部分房间信息，快速到达直播间和直播设置页面，发送弹幕和显示弹幕悬浮窗。

弹幕悬浮窗使用的是 [bilibili-live-chat](https://github.com/Tsuk1ko/bilibili-live-chat) ，


## 截图展示

![bililive-helper](img/bililive-helper.png)


## 使用方法

0. 安装 [Hammerspoon](https://www.hammerspoon.org)
1. `git clone https://github.com/xMuu/bililive-helper.git ~/.hammerspoon/bililive` 将项目克隆到本地 Hammerspoon 目录下
2. 将 `config.example.lua` 重命名为 `config.lua` 并填写好相关信息，具体配置说明请看下一部分
3. 在 `init.lua` 中添加 `require "bililive.helper"` 调用工具
4. 重载 Hammerspoon 配置（在菜单栏点击 Reload Config）


## 配置说明

```
-- 房间信息 -- 
RoomID = "" -- 房间ID
-- 直播间网址后面的数字，例如 https://live.bilibili.com/1283366 则填写 1283366

-- 用户个人信息 --
-- 用于发送弹幕，如果不需要弹幕可以留空
userRND = "" -- 用户 RND
userCookie = "" -- 用户 Cookie
userCSRF = "" -- CSRF Token
-- 使用 Chrome 或者其他浏览器登陆到直播间，打开发者工具的 Network 网络面板，手动发送一条弹幕，在 send 请求中获取相关信息填入即可

-- 弹幕面板相关 --
viewXPoint = 1600 -- 弹幕面板横坐标
-- 
viewYPoint = 150 -- 弹幕面板纵坐标
viewWidth = 320 -- 弹幕面板宽度
viewHeight = 450 -- 弹幕面板高度
showAvatar = "false" -- 是否显示头像，"true" 为显示，"false" 为不显示，不可以去掉双引号！
danmakuOrder = "bottom" -- 弹幕显示顺序， "top" 为自上向下显示，"bottom" 为自下向上显示
danmakuStayTime = 20 -- 弹幕停留时间，单位：秒
danmakuSpeed = 1000 -- 弹幕显示速度，单位：条/秒，超过的弹幕会随机忽略
showGiftCombine = 1000 -- 弹幕合并时间，单位：毫秒
```