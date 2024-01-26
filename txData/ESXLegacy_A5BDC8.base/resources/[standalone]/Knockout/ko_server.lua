--[[ ====================================================================================================================================

			DELTA DISTRICT

			Simple Knockout
				by Cosmo

]]-- ====================================================================================================================================

if KO_Config.allowPlayerHelp then
	RegisterCommand('helpup', function(source, args)
		if args[1]~=nil then
			local target=tonumber(args[1])
			if target~=source then
				if GetPlayerPed(target)~=nil then
					TriggerClientEvent("ko:helpPlayer", target, source)
				end
			else
				TriggerClientEvent('chat:addMessage', source, {color={255,0,0}, multiline=true, args={"KO", "Can't help yourself!"}})
			end
		end
	end, false)
end