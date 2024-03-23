Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    local myCoords = GetEntityCoords(GetPlayerPed(-1))
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-2036.80800000, -477.58880000, 8.32391900, true ) < 150 then
      ClearAreaOfPeds(-2036.80800000, -477.58880000, 8.32391900, 80.0, 0)
    end
  end
end)