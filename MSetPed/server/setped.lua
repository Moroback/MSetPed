Config = Config or {}
Languages = Languages or {}

dofile("shared/config.lua")
dofile("shared/languages.lua")

local function Notify(source, msgKey)
    local message = Translate(msgKey)
    if Config.NotificationType == "ESX" then
        TriggerClientEvent("esx:showNotification", source, message)
    elseif Config.NotificationType == "QBCore" then
        TriggerClientEvent("QBCore:Notify", source, message, "info")
    end
end

local function IsAuthorized(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    for _, grade in ipairs(Config.AdminGrades) do
        if xPlayer.getGroup() == grade then
            return true
        end
    end
    return false
end

RegisterCommand("setped", function(source, args)
    local src = source
    if not IsAuthorized(src) then
        Notify(src, "notAuthorized")
        return
    end

    local targetId = tonumber(args[1])
    local pedModel = args[2]

    if not targetId or not pedModel then
        Notify(src, "incorrectUsage")
        return
    end

    local targetPlayer = ESX.GetPlayerFromId(targetId)
    if not targetPlayer then
        Notify(src, "playerNotFound")
        return
    end

    if not IsModelInCdimage(pedModel) or not IsModelValid(pedModel) then
        Notify(src, "invalidPedModel")
        return
    end

    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(0)
    end

    SetPlayerModel(targetPlayer.source, GetHashKey(pedModel))
    SetModelAsNoLongerNeeded(GetHashKey(pedModel))
    Notify(src, "pedChangedSuccess")
    Notify(targetPlayer.source, "pedChangedTarget")
end, false)
