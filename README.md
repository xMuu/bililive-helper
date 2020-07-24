# bililive-helper

一个用于 Bilibili 直播的 Hammerspoon 小工具，可以查看部分房间信息，快速到达直播间和直播设置页面，发送弹幕和显示弹幕悬浮窗。
弹幕悬浮窗使用的是 [bilibili-live-chat](https://github.com/Tsuk1ko/bilibili-live-chat) ，

## 截图展示

![bililive-helper](img/bililive-helper.png)

## 使用方法

1. `git clone https://github.com/xMuu/bililive-helper.git ~/.hammerspoon/bililive` 将项目克隆到本地 Hammerspoon 目录下
2. 将 `config.example.lua` 重命名为 `config.lua` 并填写好相关信息，具体配置说明请看下一部分
3. 在 `init.lua` 中添加 `require "bililive.helper"` 调用工具
4. 重载 Hammerspoon 配置（在菜单栏点击 Reload Config）

## 配置说明

```
-- 房间信息 --
RoomID = ""

-- 用户个人信息 --
userRND = ""
userCookie = ""
userCSRF = ""

-- 弹幕面板相关 --
viewXPoint = 1600
viewYPoint = 150
viewWidth = 320
viewHeight = 450
showAvatar = "false"
danmakuOrder = "bottom"
danmakuStayTime = 20
danmakuSpeed = 1000
showGiftCombine = 1000
```