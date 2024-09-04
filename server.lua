ESX = exports["es_extended"]:getSharedObject()
ESX.RegisterServerCallback('processItemSale', function(source, cb, itemName, itemPrice, pesosItem)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        print("Player not found")
        cb(false)
        return
    end

    local playerCoords = GetEntityCoords(GetPlayerPed(source))

    local allowedLocation = vector3(5055.8145, -4596.4458, 2.8958)
    
    local distance = #(playerCoords - allowedLocation)
    if distance > 10.0 then
        return DropPlayer(source, 'Připoj se znovu.')
    end

    local itemCount = xPlayer.getInventoryItem(itemName).count
    if itemCount > 0 then
        exports.ox_inventory:RemoveItem(source, itemName, 1)
        exports.ox_inventory:AddItem(source, pesosItem, itemPrice)

        TriggerClientEvent('ox_lib:notify', source, { type = 'success', text = 'Item predaný' })
        cb(true)
    else
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', text = 'Nemáš tento item!' })
        cb(false)
    end
end)
