
function notification(title, msg, type, icon)
 
  --  exports['okokNotify']:Alert(title, msg, 5000, 'success')
    
      lib.notify({
         title = title,
         description = msg,
         type = type,
         duration = 5000,
         position = 'center-right',
         icon = icon
      })
    
end
 
function Draw3DText(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75) --comment this out to remove background on 3dtext
    ClearDrawOrigin()
end

function LoadAnimDict(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)

        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(1)
        end
    end
end

 
function DrawHudText2(text,colour,coordsx,coordsy,scalex,scaley)
	SetTextFont(7)
	SetTextProportional(7)
	SetTextScale(scalex, scaley)
	local colourr,colourg,colourb,coloura = table.unpack(colour)
	SetTextColour(colourr,colourg,colourb, coloura)
	SetTextDropshadow(0, 0, 0, 0, coloura)
	SetTextEdge(1, 0, 0, 0, coloura)
	SetTextDropShadow()
	SetTextJustification(0)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	EndTextCommandDisplayText(coordsx,coordsy)
end
