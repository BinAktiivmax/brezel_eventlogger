Citizen.CreateThread(function()
    for k, v in ipairs(Config.Triggerlist) do
        RegisterServerEvent(v)
        AddEventHandler(v, function()
            DCLog(v.whook, v.event, v.event.." **was triggert by** " .. GetPlayerName(source) .. "[" ..source.. "]")
        end)
    end
end)  

function DCLog(webhook, eventname, message)
    if webhook ~= nil then
        local connect = {
            {
                ["color"] = 13632027,
                ["footer"] = {
                    ["text"] = os.date("%c")
                },
                ["author"] = {
                    ["name"] = "Brezel-Trigger-Logger",
                    ["icon_url"] = "https://media.discordapp.net/attachments/965325468058411159/1002353967130476544/Anim.gif"
                },
                ["fields"] = {
                    {
                        ["name"] = "Info:",
                        ["value"] =  message,
                        ["inline"] = false
                    },
                }
            }
        }
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = 'Brezel-Event-Logger', embeds = connect}), { ['Content-Type'] = 'application/json' })
    end
end
