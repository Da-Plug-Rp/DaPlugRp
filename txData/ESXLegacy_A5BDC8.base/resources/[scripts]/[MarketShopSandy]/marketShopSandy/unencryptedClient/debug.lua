
--------------------------------------------------------------------------------------------
-- If you have any problem, please put this to true and open a ticket on PATAMODS Discord --
--------------------------------------------------------------------------------------------
DEBUG = false
ENABLECOMMAND = false

function aff(text)
	if DEBUG then
		print(text)
	end
end

function affError(text)
		print("^2"..text.."^7")
end