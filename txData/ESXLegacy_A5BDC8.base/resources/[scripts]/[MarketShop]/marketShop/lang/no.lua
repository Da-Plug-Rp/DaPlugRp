

if Lang ~= "NO" then
	return
end

print("Lang Defined : NO")


HTMLTRAD = {
	["Trad-Item"] 					= "Gjenstand",
	["Trad-Quantity"] 				= "Mengde",
	["Trad-Price"] 					= "Price",
	
	["Trad-NewCustomer"] 			= "Ny kunde",
	["Trad-Ticket"] 				= "Billett",
	["Trad-Paiement"] 				= "innbetaling",
	
	["Trad-Stock"] 					= "Lager",
	
	["Trad-BuyingPrice"] 			= "Kjøpspris",
	["Trad-Action"] 				= "Handling",
	["Trad-SellingPrice"] 			= "Salgspris",
	
	["Trad-Take"] 					= "Ta",
	["Trad-Put"] 					= "Sette",
	["Trad-Order"] 					= "Rekkefølge",
	["Trad-Desc"] 					= "desc.",
	
	["Trad-Sure"] 					= "Er du sikker ?",
	["Trad-ItemSel"] 				= "Velg objekt",
	["Trad-ItemDesc"] 				= "Elementbeskrivelse",

	["Trad-None"] 					= "Ingen",
	["Trad-Medium"] 				= "medium",
	["Trad-Large"] 					= "Stor",
	["Trad-Blue"] 					= "Blå",
	["Trad-Orange"] 				= "oransje",
	
	["Trad-ItemName"] 				= "Gjenstandsnavn",
	["Trad-ItemPrice"] 				= "Varerpris",
	["Trad-ImagePath"] 				= "Bildebane",
	
	
	["Trad-AvailItem"] 				= "Varen tilgjengelig",
	["Trad-QteShelves"] 			= "Mengde i hyller",
	["Trad-QteStock"] 				= "Mengde på lager",
	["Trad-Action"] 				= "Handling",
	
	["Trad-AisleManag"] 			= "disk styring",
	["Trad-AisleName"] 				= "disk navnet",
	["Trad-AisleSizeColor"] 		= "disk stølse og farge",
	
	["Trad-ShelveTypeA"] 			= "Hylle A",
	["Trad-ShelveTypeB"] 			= "Hylle B",
	["Trad-ShelveTypeC"] 			= "Hylle C",
	["Trad-ShelveTypeD"] 			= "Hylle D",
	
	["Trad-StockSize"] 				= "Lagerstørrelse",
	["Trad-AisleNameNoConf"] 		= "disken",
	
	
	["Trad-ItemInTrolley"] 			= "Vare i tralle",
	["Trad-ItemInBox"] 				= "Vare i boksen",
	
	["Trad-Remove"] 				= "Fjerne",
	["Trad-Box"] 					= "Eske",
	["Trad-Scroll"] 				= "Bla.",

}

TRAD = {
	["Trad-Order1"] 				= "Er du sikker på å bestille : ",
	["Trad-Order2"] 				= " for en totalpris : ",
	["Trad-Order3"] 				= "kr",
	["Trad-Clean"]  				= "Rengjøring",
	["Trad-Encaisser"]  			= "Kassaapparat",
	["Trad-StoreAllItem"]			= "Lagre alle kassaapparatene",
	["Trad-Payer"]  				= "Betale",
	["Trad-PoserTapis"]  			= "Sett på kassaapparat",
	["Trad-MenuStock"]  			= "Lager",
	["Trad-StoreBox"]  				= "Butikk på lager",
	["Trad-MenuEmploye"]  			= "Ansatt meny",
	["Trad-MenuPlan"]  				= "disk styring",
	["Trad-Caddie"]  				= "Tralle",
	["Trad-AccessItem"]  			= "Tilgangselement",
	["Trad-PutItem"]  				= "Lagre vare i disken",
	["Trad-Take"]  					= "Ta",
	["Trad-TakeItem"]  				= "Ta vare",
	["Trad-TakeBox"]  				= "Ta boxe",
	["Trad-NoStockTitle"]           = "Ingen lager",
	["Trad-NoStock1"]           	= "Ikke nok: ",
	["Trad-NoStock2"]           	= " I dette skallet",
	["Trad-PrendreService"]         = "I tjeneste",
	["Trad-QuitterService"]         = "Ikke på vakt",
	["Trad-Outfit"]           		= "Antrekk",
	
	["Trad-MustBeBossTitle"] 		= "Bare sjef",
	["Trad-MustBeBoss"] 			= "Bare sjef kan gjøre dette.",
	
	["Trad-NoEnterpriseMoneyTitle"] = "Ingen samfunnspenger",
	["Trad-NoEnterpriseMoney"] 		= "Ikke nok penger i Society Bank.",
	["Trad-CaisseOFF"] 				= "CashRegister av",
	["Trad-CASHONOFF"]				= "CashRegister av/på",
	["Trad-CaisseUtilise"]          = "CashRegister allerede i bruk",
	["Trad-StoreItem"]              = "Sett tilbake varen i hyller",
	
	["Trad-PasTrolleyTitle"]        = "Ingen tralle",
	["Trad-PasTrolley"]             = "Du trenger en vogn",
	
	["Trad-PasPayerTitle"]          = "Betale",
	["Trad-PasPayer"]               = "Du må betale før!",
	
	["Trad-PasObjetTitle"]          = "Ingen vare",
	["Trad-PasObjet"]               = "Ingen vare å lagre på dette kassaapparatet",
	
	["Trad-PasThuneTitle"]          = "Ikke nok penger",
	["Trad-PasThune"]               = "Ikke nok penger",
	
	["Trad-DejaPayerTitle"]         = "Allerede betalt",
	["Trad-DejaPayer"]              = "Disse varene er allerede betalt",
	
	["Trad-RienPayerTitle"]         = "Ingenting å betale",
	["Trad-RienPayer"]              = "Ingenting å betaletale",
	
	["Trad-bossactions"]            = "Ansattes ledelse",
	
}
