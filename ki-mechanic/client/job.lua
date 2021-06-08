QBCore = nil
PlayerData = {}

jobName = nil

CreateThread(function()
    while (QBCore == nil) do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Wait(100)
    end
    
    while (QBCore.Functions.GetPlayerData() == nil or QBCore.Functions.GetPlayerData().job == nil or QBCore.Functions.GetPlayerData().job.name == nil) do
		Wait(100)
	end

    PlayerData = QBCore.Functions.GetPlayerData()
    
    jobName = getJobName()
    updateUICurrentJob()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(jobInfo)
	playerJob = jobInfo
	playerData = QBCore.Functions.GetPlayerData()
end)

function getJobName()
    if (PlayerData ~= nil and PlayerData.job ~= nil and PlayerData.job.name ~= nil) then
        return PlayerData.job.name
	end
	return nil
end
