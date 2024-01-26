Strings = {
    ["keybind"] = "Realtor job menu",

    ["enter"] = "Enter the building",
    ["exit"] = "Exit the building",

    ["boss"] = "Boss actions",

    ["noone_nearby"] = "There's no one nearby.",

    -- job menu
    ["job_menu"] = "Real Estate Agent",
    ["bill_player"] = "Send a bill",
    ["rent_property"] = "Rent a property",
    ["transfer_property"] = "Transfer a property",
    ["create_property"] = "Create a property",
    ["create_walkin"] = "Create walk in property [MLO]",
    ["remove_property"] = "Remove a property",
    -- rent menu
    ["who_rent"] = "Who do you want to rent a property to?",
    ["property_rent"] = "What property do you want to rent out?",
    ["property_no_rent"] = "The property does not have a rent amount sent",
    ["rented_property"] = "You rented the property",
    -- remove property
    ["property_remove"] = "Property to remove",
    ["removed_property"] = "Removed property #%i",
    ["remove"] = "Remove property",
    -- bill menu
    ["who_bill"] = "Who do you want to bill?",
    ["houseid_bill"] = "Property id",
    ["send_bill"] = "Send bill",
    -- transfer menu
    ["who_transfer"] = "Who do you want to transfer to?",
    ["property_transfer"] = "Property to transfer",
    ["not_paid"] = "The player has not paid their invoice.",
    ["transferred_property"] = "You transferred the property",
    ["transfer"] = "Transfer property",
    -- create house menu
    ["set_entrance"] = "Set property entrance",
    ["set_garage_entrance"] = "Set garage entrance",
    ["set_garage_exit"] = "Set garage exit",
    ["add_property"] = "Add property",
    ["cancel_creation"] = "Cancel",

    ["entrance"] = "Property entrance",
    ["garage_entrance"] = "Garage entrance",
    ["garage_exit"] = "Garage spawn location",

    ["set_interior"] = "Set property interior",
    ["choose_interior"] = "Choose interior",
    ["misc_interiors"] = "Misc interiors",
    ["all_interiors"] = "Any interior",
    ["interior_set"] = "Interior set to: ~b~%s",

    ["must_entrance"] = "You must place entrance coords",
    ["must_interior"] = "You must select an interior",
    ["must_door"] = "You must select at least one door",
    ["set_propertytype"] = "Set property type",
    ["house"] = "House",
    ["apartment"] = "Apartment",
    ["finish_property"] = "Finish property creation",

    ["house_label"] = "House name",
    ["apartment_label"] = "Apartment name",
    ["short_name"] = "That name is too short.",
    ["property_price"] = "Property price",
    ["price_low"] = "That price is too low.",
    ["property_rent_amount"] = "Rent amount",

    ["add_door"] = "Add a door",
    ["door"] = "Door #%i",
    ["highlighted_door"] = "Highlighted door",
    ["add_highlighted"] = "Add highlighted door",
    ["cancel"] = "Cancel",

    ["remove_door"] = "Remove a door",
    ["door_remove"] = "Door to remove",
    ["confirm_remove_door"] = "Remove door",

    ["add_location"] = "Add wardrobe / storage",
    ["storage"] = "Add storage",
    ["wardrobe"] = "Add wardrobe",
    ["wardobe_storage"] = "Wardrobe & storage",
    ["location"] = "Wardrobe / storage #%s",

    ["remove_location"] = "Remove wardrobe / storage",
    ["confirm_remove_location"] = "Remove",
    ["location_remove"] = "Wardrobe / storage to remove",

    ["company_no_money"] = "Your company does not have enough money to create a house.",

    ["set_rent"] = "Set the rent amount",
    ["rent_amount"] = "How much should the rent be?",
    ["invalid_rent"] = "Invalid rent amount",
    ["rent_set"] = "Rent set to $%s",

    -- misc
    ["blip"] = "Real Estate Agent",
    ["invalid_property"] = "There is no property with that id.",
    ["someone_owns"] = "Someone owns that property.",
    ["already_owns"] = "They already own that property.",
    ["bill_label"] = "%s (#%i)",
    ["add_door_tip"] = "Press ~INPUT_FRONTEND_RDOWN~ to add the door\n~INPUT_FRONTEND_RRIGHT~ to cancel",
    ["select_interior"] = "Select interior",
}

-- ignore this
setmetatable(Strings, {__index = function(self, key)
    print("NO KEY", key)
    return "Error: Missing translation for \""..key.."\""
end})
