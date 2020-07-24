require "bililive.config"
require "bililive.roominfo"

local notice = hs.notify.new()
notice:hasActionButton(false)

local function urlEncode(s)     
    s = string.gsub(s, "([^%w%.%- ])", function(c) 
    return string.format("%%%02X", string.byte(c)) end)    
    return string.gsub(s, " ", "+")
end

local function onSendSucceed(msg)
    notice:title("发送成功")
    notice:subTitle(msg)
end

local function onSendFailed()
    notice:title("发送失败")
    notice:subTitle("请检查配置信息或者网络状况")
end

local function sendDanmuku(msg)
    local content, num = urlEncode(msg)
    local link = "https://api.live.bilibili.com/msg/send"
            .. "?color=16777215&fontsize=25&mode=1&msg=" .. content
            .. "&rnd=" .. userRND
            .. "&roomid=" .. RoomID
            .. "&bubble=0"
            .. "&csrf_token=".. userCSRF
            .. "&csrf=".. userCSRF
    hs.http.asyncPost(link, nil,
        {
            ["Accpet"] = "application/json, text/javascript, */*; q=0.01",
            ["Accept-Encoding"] = "gzip, deflate, br",
            ["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36",
            ["Content-Type"] = "application/x-www-form-urlencoded; charset=UTF-8",
            ["Cookie"] = userCookie
        },
        function(http_code, body, headers)
            result = hs.json.decode(body)
            if (http_code == 200 and result.code == 0) then
                onSendSucceed(msg)
            else 
                onSendFailed()
            end
            notice:send()
        end
    )
end

local chooser = hs.chooser.new(function(choice)
    if choice ~= nil then
        print(choice.msg)
        sendDanmuku(choice.msg)
    end
end)

chooser:queryChangedCallback(function(string)
    local choices = {
        {
            ["text"] = "发送弹幕：" .. string,
            ["subText"] = "到直播间 " .. roomName .. " (" .. RoomID .. ")",
            ["msg"] = string
           }
    }
    chooser:choices(choices)
end)

function showDanmukuSender() 
    chooser:show()
end

chooser:rows(1)
chooser:bgDark(true)
chooser:searchSubText(false)
hs.hotkey.bind({"cmd", "ctrl"}, "-", nil, function() chooser:show() end)

