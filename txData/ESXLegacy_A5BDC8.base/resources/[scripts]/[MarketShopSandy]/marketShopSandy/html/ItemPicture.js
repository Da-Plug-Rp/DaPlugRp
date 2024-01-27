var ItemPicture = new Object();

ItemPicture["pomme"] 	= "apple.png"
ItemPicture["banane"] 	= "banane.png"
ItemPicture["peche"] 	= "peach.png"
ItemPicture["poire"] 	= "poire.png"
ItemPicture["raisin"] 	= "raisin.png"


function ItemPictureFile(name) {
	var file = "default.png"
	console.log("ItemPictureFile")
	for (var i in ItemPicture) {
		console.log("i: "+i+" b: "+ItemPicture[i])
		if (i == name.toLowerCase()) {
		console.log("ItemPictureFile found")
			file = ItemPicture[i]
		}
	}
	if (file == "default.png") {
		warning("Image file for cashreg not found, check if ItemPicture in ItemPicture.js is correctly defined,")
		warning(" and image file present in [MarketShop]\marketShop\html\itemIMG, name of the products not defined : "+name)
	}
	return file
}