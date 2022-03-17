local status = nil
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(1)
        local playerId = PlayerId()
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
        local armor = GetPedArmour(ped)
        local show = IsPauseMenuActive()
        
        Wait(250)
        
        SendNUIMessage({
            show = IsPauseMenuActive(),
            health = (GetEntityHealth(PlayerPedId())-100),
            heal = health,
            armor = armor
        })
    end
end)

Heal = false

RegisterCommand('heal', function(source, args, rawCommand)
    if Heal == false then 
        notify("~g~Healed")
        SetEntityHealth(GetPlayerPed(-1), 200)
        Heal = true
        Wait(1)
        Heal = false
    end

    if Heal == true then
        notify("~r~ You have to wait 5 minutes since the last use of this command")
    end
end)


Armor = false

RegisterCommand('armour', function(source, args, rawCommand)
    if Armor == false then
        notify("~b~60% armour applied - Wait 5 mins to apply again")
        AddArmourToPed(GetPlayerPed(-1), 200)
        Armor = true
        Wait(1)
        Armor = false

    end
    if Armor == true then
        notify("~r~ You have to wait 5 minutes since the last use of this command") 
    end

end)

function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true,false)
end
