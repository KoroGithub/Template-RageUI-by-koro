RegisterCommand("co", function(source, args, rawcommand)
    local pos = GetEntityCoords(PlayerPedId())
    print (pos.x..", "..pos.y..", "..pos.z)
end, false)

RMenu.Add("Koro", "script_main", RageUI.CreateMenu("RageUI","Menu en rageUI by koro"))
RMenu:Get("Koro", 'script_main').Closed = function()end



    Citizen.CreateThread(function()
        while true do 
            local interval = 1
            local pos = GetEntityCoords(PlayerPedId())
            local dest = vector3(1343.7011, 1147.1629, 113.3520)
            local distance = GetDistanceBetweenCoords(pos, dest, true)

            if distance > 30 then 
                interval = 200
            else
                interval = 1
                DrawMarker(42, 1343.7011, 1147.1629, 113.3520, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                if distance < 1 then
                    AddTextEntry("HELP", "Appuyer pour acceder au menu")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlPressed(1, 51) then
                        RageUI.Visible(RMenu:Get("Koro","script_main"), true)

                    end
                end
            end

            Citizen.Wait(interval)
        end
    end)

Citizen.CreateThread(function()
    while true do 

        RageUI.IsVisible(RMenu:Get("Koro","script_main"),true,true,true,function()
        end, function()end, 1)





            Citizen.Wait(0)
        end
    end)