local VORPcore = exports.vorp_core:GetCore()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/RetryR1v2/mms-paycheck/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

      
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('Current Version: %s'):format(currentVersion))
            versionCheckPrint('success', ('Latest Version: %s'):format(text))
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end
-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------

--- Get Player Data

RegisterServerEvent('mms-paycheck:server:getplayerdata',function()
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local job = Character.job
    TriggerClientEvent('mms-paycheck:client:recieveuserdata',src,job)
end)

--- Paycheck Payment

RegisterServerEvent('mms-packcheck:server:PaychekSystem',function()
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local job = Character.job
    local jobgrade = Character.jobGrade
    local firstname = Character.firstname
    local lastname = Character.lastname
    for h,jobs in ipairs(Config.Jobs) do
        if job == jobs.JobName then
            for a,grades in ipairs(jobs.Grades) do
                if jobgrade == grades.Grade then
                    local Payment = grades.Payment
                    Character.addCurrency(0,Payment)
                    VORPcore.NotifyTip(src,_U('PaymentDone') .. Payment,4000)
                    if Config.WebHook then
                        VORPcore.AddWebhook(Config.WHTitle, Config.WHLink,firstname .. ' ' .. lastname .. _U('GotAPayment') .. Payment, Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
                    end
                end
            end
        end
    end
end)


--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()