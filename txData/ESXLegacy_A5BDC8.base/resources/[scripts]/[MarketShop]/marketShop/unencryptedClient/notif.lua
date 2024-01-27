
---------------------------------------------------------
---------------- DON'T TOUCH THIS -----------------------
---------------------------------------------------------
RegisterNetEvent('marketShop:notif')
AddEventHandler('marketShop:notif', function (title,text,icon,iconcolor)
	notif(title,text,icon,iconcolor)
end)


----------------------------------------------------------
----------------------------------------------------------
-- You can replace here by YOUR own notification system --
----------------------------------------------------------
----------------------------------------------------------


function notif(title,text,icon,iconcolor)
	lib.notify({
    id = 'some_identifier2',
    title = title,
    description = text,
    position = 'top-left',
    style = {
        backgroundColor = '#141517',
        color = '#909296'
    },
    icon = icon,
    iconColor = iconcolor
})


end
