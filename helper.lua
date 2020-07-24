require "bililive.config"
require "bililive.roominfo"
require "bililive.sender"
require "bililive.viewer"

local menubar = hs.menubar.new()
local menuData = {}
menubar:setIcon(hs.image.imageFromURL("https://www.bilibili.com/favicon.ico"):setSize({w=16,h=16}))

-- 创建菜单
function buildMenu()
   menuData = {}
   if not panelStatus then 
      table.insert(menuData, {title = '显示面板', fn = function() changePanelStatus() buildMenu() end})
   else 
      table.insert(menuData, {title = '关闭面板', fn = function() changePanelStatus() buildMenu() end})
   end
   table.insert(menuData, {title = '-'})
   table.insert(menuData, {title = '发送弹幕', fn = function() showDanmukuSender() end})
   table.insert(menuData, {title = '-'})
   table.insert(menuData, {title = '直播间 >', fn = function() hs.execute('open https://live.bilibili.com/' .. roomID) end})
   table.insert(menuData, {title = '开播设置 >', fn = function() hs.execute('open https://link.bilibili.com/p/center/index#/my-room/start-live') end})
   table.insert(menuData, {title = '-'})
   table.insert(menuData, {title = '用户名：' .. userName, disabled = true})
   table.insert(menuData, {title = '直播等级：Lv.' .. tostring(userLiveLevel), disabled = true})
   table.insert(menuData, {title = '房间名：' .. roomName, disabled = true})
   table.insert(menuData, {title = '关注人数： ' .. tostring(roomAttention).." 人", disabled = true})
   menubar:setMenu(menuData)
end

buildMenu()
hs.timer.doEvery(65, buildMenu)
