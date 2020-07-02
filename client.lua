----- boubeur ----- https://www.twitch.tv/boubeur62tv ;) --------

local keys = { ['G'] = 0x760A9C6F, ['S'] = 0xD27782E3,["LALT"] = 0xE8342FF2, ['W'] = 0x8FD015D8, ['H'] = 0x24978A28, ['G'] = 0x5415BE48, ["ENTER"] = 0xC7B5340A, ['E'] = 0xDFF812F9, ["J"] = 0xF3830D8E }

Citizen.CreateThread(function()
    WarMenu.CreateMenu('MenuReloadSkin', "Rechargement")


    while true do

        local ped = GetPlayerPed(-1)
        local coords = GetEntityCoords(PlayerPedId())
        local charId = tonumber(1)



       if WarMenu.IsMenuOpened('MenuReloadSkin') then
			if WarMenu.Button('Recharger ses vetements') then

                ExecuteCommand('loadskin') --- ok 
              Wait(3000)
                ExecuteCommand('loadcloath') --- ok
              Wait(3000)
			  
            WarMenu.CloseMenu() 
            end

            WarMenu.Display()
 
        elseif (Vdist(coords.x, coords.y, coords.z, -289.8593, 810.0917, 118.4096) < 2.0) then
               TriggerEvent('redem_roleplay:Tip', "Pour ouvrir le magasin appuyez sur [E].", 100)
			   	Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0) 
                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                 if IsControlJustPressed(0, 0xCEFD9220) then
              TaskStartScenarioAtPosition(GetPlayerPed(), GetHashKey("PROP_PLAYER_BARBER_SEAT"), -289.8593, 810.0917, 118.40+0.45, 326.39, 0, 0, 1)
               
			   WarMenu.OpenMenu('MenuReloadSkin')
               end
        end
        Citizen.Wait(0)
    end
end)

function IsPlayerNearCoords(x, y, z)
    local playerx, playery, playerz = table.unpack(GetEntityCoords(GetPlayerPed(), 0))
    local distance = GetDistanceBetweenCoords(playerx, playery, playerz, x, y, z, true)

    if distance < 1 then
        return true
    end
end


