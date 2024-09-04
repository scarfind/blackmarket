ESX = exports["es_extended"]:getSharedObject()
RegisterNetEvent('sellItems', function()
    local elements = {}

    for itemName, itemInfo in pairs(Config.ItemsForSale) do
        table.insert(elements, {
            title = itemName,
            description = 'Predaj tento item za ' .. itemInfo.price .. ' pesos',
            event = 'sellItem',
            args = {
                itemName = itemName,
                itemPrice = itemInfo.price,
                pesosItem = itemInfo.pesosItem
            }
        })
    end

    lib.registerContext({
        id = 'sell_menu',
        title = 'Sell Items',
        options = elements
    })

    lib.showContext('sell_menu')
end)

RegisterNetEvent('sellItem', function(data)
    local itemName = data.itemName
    local itemPrice = data.itemPrice
    local pesosItem = data.pesosItem

    ESX.TriggerServerCallback('processItemSale', function(success)
        if success then

            print("Item uspesne predany")
        else

            print("Predaj zlyhal.")
        end
    end, itemName, itemPrice, pesosItem)
end)


exports.ox_target:addSphereZone({
    coords = Config.TargetCoords,
    radius = Config.TargetRadius,
    options = {
        {
            name = 'openSellMenu',
            icon = 'fa-solid fa-dollar-sign',
            label = 'Prodej itemu',
            onSelect = function()
                TriggerEvent('sellItems')
            end
        }
    },
    distance = 2.5
})
