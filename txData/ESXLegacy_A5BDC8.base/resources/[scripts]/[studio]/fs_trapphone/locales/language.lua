lang = {
    --Trap Phone Menu
    ['trap_phone'] = { text = 'Trap Phone', icon = 'fa-solid fa-mobile' },
    ["don't_distrub"] = { text = "Don't Distrub", icon = 'fa-solid fa-moon' },
    ["deline_call"] = { text = "Decline", icon = 'fa-solid fa-phone-slash' },
    ["private_caller"] = { text = "Private Caller", },
    ["answer_call"] = { text = "Call", icon = "fa-solid fa-phone-volume" },
    ["contact_customer"] = { text = "Contact Customer", icon = "fa-solid fa-phone" },
    ["make_one_call"] = { text = "Only make one sell, phone still on DND" },
    ["Press_E_Sell_Drugs"] = { text = "Press [E] to Sell Drugs!" },
    


    -- notification
    ["do_not_have_enough"] = { title = "Trap Phone:", text = "You don't have enough drugs", type = "error", duration, 5000, icon = "fa - solid fa - triangle - exclamation " },
    ["not_enough_jobs_active"] = { title = "Trap Phone:", text = "Don't have enough job members active", type = "error", duration = 5000, icon = "fa - solid fa - triangle - exclamation " },
    ["not_allowed_in_veicle"] = {title = "Trap Phone", text = "You can't do this while inside vehicle.", type = "error", duration = 5000,icon = "fa-solid fa-car" },
    ["buyer_is_not_avialble"] = {title = "Trap Phone", text = "Buyer is not avilable now.", type = "error", duration = 5000,icon = "fa-solid fa-person" },
    ["decline_menu_notify"] = {title = "Trap Phone", text = "You decline to answer the phone.", type = "error", duration = 5000,icon = "fa-solid fa-person" },
    ["donot_have_enough_item"] = {title = "Trap Phone", text = "You don't have enough drug to sell.", type = "error", duration = 5000,icon = "fa-solid fa-person" },
    ["drug_rejected"] = {title = "Trap Phone", text = "I was willing for something better i want that.", type = "inform", duration = 5000,icon = "fa-solid fa-person" },
    ["phone_rining_with_calls"] = {title = "Trap Phone", text = "Your Phone will be rininig with calls.", type = "success", duration = 5000,icon = "fa-solid fa-person" },
    ["drug_sold"] = {title = "Trap Phone", text = " Sold", type = "success", duration = 5000,icon = "fa-solid fa-person" },
    ["customer_enroute"] = {title = "Trap Phone", text = "Customer enroute", type = "success", duration = 5000,icon = "fa-solid fa-person" },
    ["phone_on_donot_distrub"] = {title = "Trap Phone", text = "Your Phone is now on don't distrub.", type = "success", duration = 5000,icon = "fa-solid fa-person" },
    ["not_in_radius"] = {title = "Trap Phone", text = "You are not in clients Radius", type = "error", duration = 5000,icon = "fa-solid fa-person" },
    
    ["check_remain_call_limit"] = {title = "Trap Phone", text = "You already made %s call out of %s", type = "error", duration = 5000,icon = "fa-solid fa-person" },
    ["you_alreadymade_max_limit"] = {title = "Trap Phone", text = "You already made maxium number of calls.now Wait for storm", type = "error", duration = 5000,icon = "fa-solid fa-person" },
    ["dispach_police_notify"] = {title = "Trap Phone", text = "Drug deal in progress", blip = 'selling drug' },
    

    --print error on bad config
    ["select_correct_SendBuyerTextProgressBar"] = {text = 'Warning!! Please Select Correct Config.SendBuyerTextProgressBar.Type'},
    ["select_correct_BuyerCallClientProgressBar"] = {text = 'Warning!! Please Select Correct Config.BuyerCallClientProgressBar.Type'},    


    --progressbar
    ["typing_trying_to_contact_client"] = { text = "Trying to contact Client." },
    ["answering_client_calls"] = { text = "Answering Clients Calls." },
}
