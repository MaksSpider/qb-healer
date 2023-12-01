local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-healer:pay', function(amount)
	local Player = QBCore.Functions.GetPlayer(source)

	if not Player or amount <= 0 then return end

	Player.Functions.RemoveMoney('cash', amount)
end)