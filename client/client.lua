local VORPcore = exports.vorp_core:GetCore()

local PaycheckTimer = 0
local JobTimer = 0
------------------------------------------------------------------------------

Citizen.CreateThread(function()
    Citizen.Wait(10000)
    TriggerServerEvent('mms-paycheck:server:getplayerdata')
end)


RegisterNetEvent('vorp:SelectedCharacter')
AddEventHandler('vorp:SelectedCharacter', function()
    Citizen.Wait(10000)
    TriggerServerEvent('mms-paycheck:server:getplayerdata')
end)

RegisterNetEvent('mms-paycheck:client:recieveuserdata')
AddEventHandler('mms-paycheck:client:recieveuserdata',function(job)
    for h,v in ipairs(Config.Jobs) do
        print(v.JobName)
        if v.JobName == job then
            JobTimer = v.PaycheckTimer
            TriggerEvent('mms-paycheck:client:PaycheckTimer',JobTimer)
        end
    end
end)



RegisterNetEvent('mms-paycheck:client:PaycheckTimer')
AddEventHandler('mms-paycheck:client:PaycheckTimer',function (JobTimer)
    while true do
        Citizen.Wait(1000)
        PaycheckTimer = PaycheckTimer + 1
        if PaycheckTimer == JobTimer then
            PaycheckTimer = 0
            TriggerServerEvent('mms-packcheck:server:PaychekSystem')
        end
    end
end)
