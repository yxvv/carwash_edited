Key = 38 -- E

vehicleWashStation = {
	{26.5906,  -1392.0261,  27.4634},
	{167.1034,  -1719.4704,  27.3916},
	{-74.5693,  6427.8715,  29.5400},
	{-699.6325,  -932.7043,  17.1139},
	{1362.5385, 3592.1274, 34.091}
}


local timer2 = false
local mycie = false

RegisterNetEvent('yx:startmyjnia')
AddEventHandler('yx:startmyjnia', function()
	TriggerServerEvent('yxmyjnia:sprawdzkaske')
end)


RegisterNetEvent('yxmyjnia:umyj')
AddEventHandler('yxmyjnia:umyj', function(price)
	local car = GetVehiclePedIsUsing(PlayerPedId())
	local coords = GetEntityCoords(PlayerPedId())
	mycie = true
	FreezeEntityPosition(car, true)
	if not HasNamedPtfxAssetLoaded("core") then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Wait(1)
		end
	end
	UseParticleFxAssetNextCall("core")
	particles  = StartParticleFxLoopedAtCoord("ent_amb_waterfall_splash_p", coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	UseParticleFxAssetNextCall("core")
	particles2  = StartParticleFxLoopedAtCoord("ent_amb_waterfall_splash_p", coords.x + 2, coords.y, coords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	timer = 15
	timer2 = true
    Citizen.CreateThread(function()
		while timer2 do
            Citizen.Wait(0)
            Citizen.Wait(1000)
            if(timer > 0)then
				timer = timer - 1
			elseif (timer == 0) then
				mycie = false
				WashDecalsFromVehicle(car, 1.0)
				SetVehicleDirtLevel(car)
				FreezeEntityPosition(car, false)
				exports.FeedM:ShowNotification('~g~Umyto ~w~Auto')
				StopParticleFxLooped(particles, 0)
				StopParticleFxLooped(particles2, 0)
				timer2 = false
			end
        end
    end)

end)

RegisterNetEvent('yxmyjnia:niemaszkasy')
AddEventHandler('yxmyjnia:niemaszkasy', function(moneyleft)
	exports.FeedM:ShowNotification('~r~Na naprawę brakuje ci~w~ ' .. moneyleft .. '$')
end)