require "bililive.config"

-- 面板状态
panelStatus = false

-- 面板定义
view = hs.webview.new({x = viewXPoint, y = viewYPoint, w = viewWidth, h = viewHeight})
view:bringToFront(true)
view:transparent(true)
view:windowStyle("nonactivating")
view:url("file://" .. os.getenv("HOME") .. "/.hammerspoon/bililive/web/livechat.html"
    .. "#room="     .. roomID 
    .. "&face="     .. showAvatar
    .. "&display="  .. danmakuOrder
    .. "&stay="     .. danmakuStayTime
    .. "&speed="    .. danmakuSpeed
    .. "&giftComb=" .. showGiftCombine
)

-- 切换面板状态
function changePanelStatus()
    if (panelStatus == true) then
        panelStatus = false
        view:hide()
    else
        panelStatus = true
        view:show()
    end
end

-- 绑定快捷键
hs.hotkey.bind({"cmd", "ctrl"}, "=", nil, function() changePanelStatus() end)