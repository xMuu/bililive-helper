require "bililive.config"

-- API 地址
local apiUrl = "https://api.live.bilibili.com/xlive/web-room/v1/index/getInfoByRoom?room_id="

local roomInfo

-- 获取房间信息
local function updateRoomInfo()
    code, content, headers = hs.http.get(apiUrl..RoomID, nil)
    roomInfo = hs.json.decode(content)
end

updateRoomInfo()
roomName = roomInfo.data.room_info.title
userName = roomInfo.data.anchor_info.base_info.uname
userLiveLevel = roomInfo.data.anchor_info.live_info.level
roomAttention = roomInfo.data.anchor_info.relation_info.attention

-- 定时更新信息
hs.timer.doEvery(3600, updateRoomInfo)