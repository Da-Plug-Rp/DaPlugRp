var CurrentPseudo
var tempDATA
var Trad
// aff($('#TradItem').innerHTML)
// aff($('#TradItem').value)
// $('#TradItem').innerHTML = "Itemmmm"
// aff(document.getElementById('TradItem'))
// document.getElementById('TradItem').innerHTML = "Itemmmm"
var tempItem = ""
var tempAction = ""
var tempQTE = 0
var tempPrice = 0
var tempidStall = 0

var AisleDefineType =""
var cashRegCurrentHandle = 0
var cashRegCurrentType = ""
var cashRegFinalized = false
var cashRegListItem
var cashRegListItemScanned
var cashRegCurrentIndex = 0
var cashRegLastIndex = 0
var currentIhmOpen = ""
var typeStall
function OverScan() {
	
}

function NotOverScan() {
	
}

function ResetBag() {
	
}

var currentOverlay =""
function Overlay(data) {
	var tempPath = "./img/overlayAisle/r"+data.id.replace('Aisle-', '')+".png"
	
	if ( tempPath != currentOverlay) {
		// console.log("Overlay !!! : image path: "+tempPath)
		$(".ImageOverlay").attr("src", tempPath);
		currentOverlay = tempPath
	}
}

function NotOverlay(data) {
	// console.log("Overlay !!!")
}

function FadeBag() {
	 $('#ui-draggable').animate({left:'-=170%'});
	
	setTimeout(function(){
		$('.CashRegister').css("background-image", 'url("./img/CashReg.png")');
	}, 300)
	
	setTimeout(function(){
		$('#ui-draggable').fadeOut(250)
		setTimeout(function(){
			document.getElementById("ui-draggable").style = ""
			$('#ui-draggable').fadeIn(250)
		}, 300)
	}, 300)
}



function TakeFromStock(item) {
	var current = item.parentNode.parentNode
	var elmtItem = current.querySelector(".Name")
	var elmtQte = current.querySelector(".Quantity")
	
	aff("current : "+elmtItem.innerHTML)
	// aff("test : "+current.find("Name").text())
	tempItem = elmtItem.innerHTML
	tempAction = "take"
	tempQTE = elmtQte.innerHTML
	// aff(tempItem)
	$('.MenuPopupQTE').fadeIn(500)
}

function ResetBoxList() {
	$('.eachListBoxStock').fadeOut(100)
	setTimeout(function(){
		$('.eachListBoxStock').remove()
	}, 100)
	
}


function PutInStock(item) {
	tempItem = item
	tempAction = "put"
	aff(tempItem)
	$('.MenuPopupQTE').fadeIn(500)
}

function CancelQTE() {
	tempItem = ""
	tempAction = ""
	
	
	$('.MenuPopupQTE').fadeOut(500)
	
	
}
function RemoveFromBoxStock(elmt) {
	var elmtToDelete = elmt.parentNode.parentNode
	elmtToDelete.remove()
}

 
function ValidateBoxList() {
	var myArray = {}
	var cptElement = 0
	$('.eachListBoxStock').each(function( index ) {
		aff("test :"+$(this).find(".Name").text())
		Name = $(this).find(".Name").text()
		Qte = $(this).find(".Quantity").text()
		myArray[Name] = Qte
		cptElement = cptElement + 1
	});
	if (cptElement > 0 ) {
		$.post('https://marketShop/TakeBoxInStock', JSON.stringify({items : myArray}));
		$('.eachListBoxStock').remove()
	}else{
		aff("no items selected")
	}
}

function ValidateQTE() {
	// tempItem = ""
	// tempAction = ""
	if (tempAction === "order") {
		var qte = $('.PopupQTEVal').val()
		aff("ValidateQTE item: "+tempItem+" qte: "+qte)
		$.post('https://marketShop/CalculateOrderInfoText', JSON.stringify({item : tempItem, quantity : qte }));
		
		// var qte = $('.PopupQTEVal').val()
		
	} else if (tempAction === "take") {
		var qte = $('.PopupQTEVal').val()
		if (parseInt(tempQTE) >= parseInt(qte)) {
			$('.tbodyMenuStockBoxList').append(`
				<tr class="eachListBoxStock" id="IDaLaCon">
					<td class="Name">`+tempItem+`</td>
					<td class="Quantity">`+qte+`</td>
					<td class="Action">
						<input class="buttonStyle" type="button" value="`+Trad["Trad-Remove"]+`" onclick="RemoveFromBoxStock(this)">
					</td>
				</tr>
			`)
		} else {
			aff("Not Enough Stock tempQTE:"+tempQTE+" qte: "+qte)
		}
		$('.MenuPopupQTE').fadeOut(500)
	} else {
		$('.MenuPopupQTE').fadeOut(500)
		var qte = $('.PopupQTEVal').val()
		
		$.post('https://marketShop/TakeOrPutStock', JSON.stringify({action : tempAction, item : tempItem, quantity : qte }));
	}
}


function ValidateINFO() {
	var qte = $('.PopupQTEVal').val()
	aff("ValidateQTE item: "+tempItem+" qte: "+qte+" price: "+tempPrice)
	$.post('https://marketShop/OrderForStockValidated', JSON.stringify({item : tempItem, quantity : qte, price : tempPrice }));
	
	$('.MenuPopupInfoValidate').fadeOut(500)// tempItem = ""
	// tempAction = ""
	// if (tempAction === "order") {
		// var qte = $('.PopupQTEVal').val()
		// aff("ValidateQTE item: "+tempItem+" qte: "+qte)
		// $.post('https://marketShop/CalculateOrderInfoText', JSON.stringify({item : tempItem, quantity : qte }));
		
		// var qte = $('.PopupQTEVal').val()
		
	// } else {
		// $('.MenuPopupQTE').fadeOut(500)
		// var qte = $('.PopupQTEVal').val()
		
		// $.post('https://marketShop/TakeOrPutStock', JSON.stringify({action : tempAction, item : tempItem, quantity : qte }));
	// }
}


function InfoOrderText(data,price) {
	$('.MenuPopupQTE').fadeOut(500)
	$('.MenuPopupInfoValidate').fadeIn(500)
	$('.MenuPopupInfoValidateTextInput').val(data)
	tempPrice = price
}

function OrderForStock(item) {
	tempItem = item
	tempAction = "order"
	// aff("yoloooo"+tempItem)
	
	
	$('.MenuPopupQTE').fadeIn(500)
	
	
}

function DefineProducts(item) {
	tempItem = item
	tempAction = "define"
	aff("DefineProducts "+tempItem)
	$.post('https://marketShop/OpenItemDesc', JSON.stringify({item : tempItem}));
	
	// $('.MenuPopupQTE').fadeIn(500)
	
	
}

function StockSearch (value) {
	 var localValue = value.toLowerCase()
	 totalElement = $('.eachListStock')
	 aff("totalElement : "+ totalElement)
	 var size = Object.keys(totalElement).length;
	 for (let i = 0;  i <= size; i++) {
		if (totalElement[i] != undefined) {
			var CurValue = totalElement[i].querySelector(".Name").innerHTML.toLowerCase()
			if (CurValue.search(localValue) == -1) {
				totalElement[i].hidden = true;
			} else {
				totalElement[i].hidden = false;
			}
			// aff() 
		}
	 }
	 // totalElement.forEach(function (a, b) {
		// aff("spam") 
	 // });
}

function OpenMenuStock(data){
	ResetAllUI()
	$('.MenuStockGlobal').fadeIn(500)
	
	$('.eachListStock').remove()
	
	data.forEach(function (a, b) {
		

		$('.tbodyMenuStockList').append(`
			<tr class="eachListStock" id="IDaLaCon">
				<td class="Name">${a.name}</td>
				<td class="Quantity">${a.quantity}</td>
				<td class="BuyingPrice">${a.buyingPrice}$</td>
				<td class="Action">
					<input class="buttonStyle" type="button" value="`+Trad["Trad-Take"]+`" onclick="TakeFromStock(this)">
					<input class="buttonStyle" type="button" value="`+Trad["Trad-Put"]+`" onclick='PutInStock("${a.name}")'>
					<input class="buttonStyle" type="button" value="`+Trad["Trad-Order"]+`" onclick='OrderForStock("${a.name}")'>
					<!--<input class="buttonStyle" type="button" value="`+Trad["Trad-Desc"]+`" onclick='DefineProducts("${a.name}")">-->
				</td>
				<td class="SellingPrice">${a.sellingprice}$</td>
			</tr>
		`)
		
		//<input class="buttonStyle" type="button" value="Buy" onclick="OpenMenuItemDescInShop(${a.id},`+idStall+`)">
		
		
		// aff("a:"+a.name+" b:"+b)
	});
	
	
	
	
}

function OpenMenuEmployee(){
	ResetAllUI()
	$('.MenuEmployee').fadeIn(500)
}


 $( function() {
	 
	 
  // $('#ui-draggable').stop();
	 
    $( "#ui-draggable" ).draggable({ revert: "invalid", containment: ".noselect", scroll: false,
		start: function (event, ui) {
			
            },
		stop: function () {
               
            }


	});
	$( "#ui-droppable" ).droppable({
      classes: {
        "ui-droppable-active": "ui-state-active",
        "ui-droppable-hover": "ui-state-hover"
      },
      drop: function( event, ui ) {
        $( this )
          // .addClass( "ui-state-highlight" )
          // .find( "p" )
            // .html( "Dropped!" );
      }
    });
	$( "#ui-droppable2" ).droppable({
	tolerance: "intersect",
      classes: {
        "ui-droppable-active": "ui-state-active",
        "ui-droppable-hover": "ui-state-hover"
      },
      over: function(event, ui) {
                // $(this).css('background', 'orange');
				aff("event: "+event+" ui: "+ui.draggable)
				toto = ui.draggable
				// toto.fadeOut(200)
				// $('#beep')[0].play()
				// $('#beep').trigger("play");
				$('.CashRegister').css("background-image", 'url("./img/CashRegGreen.png")');
				 
				FadeBag()
				ItemScanned()
				// UpdateCurrentCashReg()
      },
	  out: function(event, ui) {
		$('.CashRegister').css("background-image", 'url("./img/CashReg.png")');
		// $(this).css('background', 'cyan');
	  }
    });
  } );
 

function OpenCashReg(item,handle,itemScanned,status){
	ResetAllUI()
	$('.CashRegRightUpImg').fadeIn(1)
	$('.CashRegRightUpName').fadeIn(1)
	$('.CashRegBagRight').fadeIn(1)
	$('.CashRegister').fadeIn(500)
	cashRegListItem = JSON.parse(item)
	cashRegListItemScanned = JSON.parse(itemScanned)
	cashRegCurrentIndex = 0
	cashRegLastIndex = 0
	$('.CashRegListStock').remove()
	aff("JS OpenCashReg status.HaveToPay : "+status.HaveToPay)
	if (status.HaveToPay == false){
		$('.GlobalTicket').addClass('GlobalTicketNoTransition') 
		$('.GlobalTicket').fadeOut(0)
		$('.GlobalTicket').removeClass('GlobalTicketON')
		var tempVal = status.Value 
		$('.CashRegTicketPrice').text(tempVal.toFixed(2))
	} else {
		$('.GlobalTicket').addClass('GlobalTicketNoTransition') 
		$('.GlobalTicket').fadeIn(1)
		$('.GlobalTicket').addClass('GlobalTicketON')
		var tempVal = status.Value 
		$('.CashRegTicketPrice').text(tempVal.toFixed(2))
	}
	// data.forEach(function (a, b) {
	var compteurItem = 0
	for (let i = 0; cashRegListItem[i] && i < 500; i++) {
		aff("cashRegListItem name : "+cashRegListItem[i].name+" qte: "+cashRegListItem[i].qte+" price: "+cashRegListItem[i].price)
		cashRegCurrentIndex = 0
		compteurItem += 1
	}
	aff("JS OpenCashReg nbitem to scan : "+compteurItem)
	cashRegLastIndex = compteurItem-1
	if (cashRegLastIndex < 0) {
		
	$('.CashRegRightUpImg').fadeOut(1)
	$('.CashRegRightUpName').fadeOut(1)
	$('.CashRegBagRight').fadeOut(1)
	} else {
		$('.CashRegRightUpImg').fadeOut(1)
		$('.CashRegRightUpName').fadeOut(1)
	}
	// var compteurItem = 0
	if (cashRegListItemScanned != null) { 
		aff("cashRegListItemScanned != null")
		for (let i = 0; cashRegListItemScanned[i] && i < 500; i++) {
			aff("cashRegListItemScanned name : "+cashRegListItemScanned[i].name+" qte: "+cashRegListItemScanned[i].qte+" price: "+cashRegListItemScanned[i].price)
			$('.tbodyMenuCashRegList').append(`
				<tr class="CashRegListStock" id="IDaLaCon">
					<td class="Name">`+cashRegListItemScanned[i].name+`</td>
					<td class="Quantity">`+cashRegListItemScanned[i].qte+`</td>
					<td class="SellingPrice">`+cashRegListItemScanned[i].price+`$</td>
				</tr>
				
				`)
		}
	} else {
		aff("cashRegListItemScanned == null")
	}
}



function ItemScanned() {
	aff("ItemScanned currentIndex : "+cashRegCurrentIndex+" last Index : "+cashRegLastIndex)
	$('.tbodyMenuCashRegList').append(`
	<tr class="CashRegListStock" id="IDaLaCon">
		<td class="Name">`+cashRegListItem[cashRegCurrentIndex].name+`</td>
		<td class="Quantity">`+cashRegListItem[cashRegCurrentIndex].qte+`</td>
		<td class="SellingPrice">`+cashRegListItem[cashRegCurrentIndex].price+`$</td>
	</tr>
	
	`)
	$('.CashRegRightUpImg').fadeIn(1)
	$('.CashRegRightUpName').fadeIn(1)
	$.post('https://marketShop/ItemScanned', JSON.stringify({item : cashRegListItem[cashRegCurrentIndex].name, quantity : cashRegListItem[cashRegCurrentIndex].qte , cashRegHandle : cashRegCurrentHandle, typeCashReg : cashRegCurrentType}));
	if ((cashRegCurrentIndex+1) <= cashRegLastIndex) {
		var image = ItemPictureFile(cashRegListItem[cashRegCurrentIndex].name)
		$('.CashRegRightUpImgFiles').attr("src", "itemIMG/"+image);
		$('.CashRegRightUpNameText').text(cashRegListItem[cashRegCurrentIndex].qte+" - "+cashRegListItem[cashRegCurrentIndex].name);
	} else {
		var image = ItemPictureFile(cashRegListItem[cashRegCurrentIndex].name)
		$('.CashRegRightUpImgFiles').attr("src", "itemIMG/"+image);
		$('.CashRegRightUpNameText').text(cashRegListItem[cashRegCurrentIndex].qte+" - "+cashRegListItem[cashRegCurrentIndex].name);
		setTimeout(function(){
			$('.CashRegBagRight').fadeOut(1)
		}, 300)
	}
	cashRegCurrentIndex += 1
} 

function JSprintTicket(item){

	$('.GlobalTicket').removeClass('GlobalTicketNoTransition') 
	$('.GlobalTicket').fadeIn(1)
	$('.GlobalTicket').addClass('GlobalTicketON')
	$('.CashRegTicketPrice').text(item.toFixed(2))
}
var antiSpam = false
function CashRegTicket(item,handle){
	if (antiSpam == false) {
		antiSpam = true
		$.post('https://marketShop/TicketPrint', JSON.stringify({handle : cashRegCurrentHandle, typeCashReg : cashRegCurrentType}));
		setTimeout(function(){
			antiSpam = false
		}, 1500)
	} else {
		aff("Spam detected")
	}
	// $('#ticketprint').trigger("play");

	// $('.CashRegTicketPrice').addClass('CashRegTicketPriceON')
	
}

	
function OpenMenuItemDesc(name,price,image,desc){
	ResetAllUI()
	$('.MenuItemDesc').fadeIn(500)
	
	$('.MenuItemNameInputItemName').val(name)
	$('.MenuItemNameInputItemPrice').val(price)
	$('.MenuItemNameInputItemImage').val(image)
	$('.InputItemDesc').val(desc)
	
}

function OpenMenuItemDescInShop(name,price,image,desc){
	aff("OpenMenuItemDescInShop ")

	// readonly="readonly"
	ResetAllUI()
	$('.MenuItemDescInShop').fadeIn(500)
	
	

	$('.InputItemNameInShop').attr('placeholder',name);
	$('.ImageFileInShop').attr('src',image);
	$('.InputItemDescInShop').attr('placeholder',desc);
	

}

function GetStockValueForItem(itemName,stockdata) {
	var quantity = 0
	// aff("GetStockValueForItem " + Object.keys(stockdata).length)
	for (let i = 0; stockdata[i] && i < 500; i++) {
		if (stockdata[i].name == itemName) {
			aff("qte found " + stockdata[i].quantity + " " + stockdata[i].name)
			quantity = stockdata[i].quantity
			break;
		}
	}
	return quantity
}

function OpenMenuItemDescInStall(id,aisleItemA,aisleItemB,aisleItemC,aisleItemD,CatA,CatB,CatC,CatD,TradCatA,TradCatB,TradCatC,TradCatD,itemStock){
	aff("OpenMenuItemDescInStall")
	if (AisleDefineType== "Regular") {
		$('.addItemDescMenuInStall').attr('id',id);
		
		$('.AisleDescInStall').prop( "disabled", false );
		
		$('.AisleCatA').attr('id',CatA);
		$('.AisleCatB').attr('id',CatB);
		$('.AisleCatC').attr('id',CatC);
		$('.AisleCatD').attr('id',CatD);
		
		$('.AisleCatA').text(TradCatA);
		$('.AisleCatB').text(TradCatB);
		$('.AisleCatC').text(TradCatC);
		$('.AisleCatD').text(TradCatD);
		aff("A: "+TradCatA+" B: "+TradCatB+" C: "+TradCatC+" D: "+TradCatD)
		
		$('.MenuStockGlobal').fadeOut(500)
		$('.MenuEmployee').fadeOut(500)
		$('.MenuItemDesc').fadeOut(500)
		$('.MenuItemDescInShop').fadeOut(500)
		$('.MenuItemDescInStall').fadeIn(500)
		// $('.PlanContainer').fadeOut(500)
		$('.MenuPopupQTE').fadeOut(500)
		// toto = data
		// tempidStall = idStall
		// aff("id "+id+"   item "+item)
		$('.eachListInStallA').remove()
		$('.eachListInStallB').remove()
		$('.eachListInStallC').remove()
		$('.eachListInStallD').remove()
		// tempDATA = data
		for (let i = 0; aisleItemA[i] && i < 500; i++) {
			aff("Aobj val : " + Object.values(aisleItemA[i])+" objKey: "+Object.keys(aisleItemA[i]))
			if (typeof aisleItemA[i].name  !== 'undefined') {
				var stock = GetStockValueForItem(aisleItemA[i].name,itemStock)
				$('.tbodyMenuItemDescInStallA').append(`
				<tr class="eachListInStallA" id="IDaLaCon">
					<td class="ItemName">`+aisleItemA[i].name+`</td>
					<td class="ItemQteInShelves">`+aisleItemA[i].qte+`</td>
					<td class="ItemQteInStock">`+stock+`</td>
					<td class="Action">
						<input class="buttonStyle" type="button" id="`+aisleItemA[i].name+`" value="`+Trad["Trad-Remove"]+`" onclick="RemoveFromRegularStall(this)">
					</td>
				</tr>
				`)
			}
		}
		
		for (let i = 0; aisleItemB[i] && i < 500; i++) {
			aff("Bobj val : " + Object.values(aisleItemB[i])+" objKey: "+Object.keys(aisleItemB[i]))
			if (typeof aisleItemB[i].name  !== 'undefined') {
				var stock = GetStockValueForItem(aisleItemB[i].name,itemStock)
				$('.tbodyMenuItemDescInStallB').append(`
				<tr class="eachListInStallB" id="IDaLaCon">
					<td class="ItemName">`+aisleItemB[i].name+`</td>
					<td class="ItemQteInShelves">`+aisleItemB[i].qte+`</td>
					<td class="ItemQteInStock">`+stock+`</td>
					<td class="Action">
						<input class="buttonStyle" type="button" id="`+aisleItemB[i].name+`" value="`+Trad["Trad-Remove"]+`" onclick="RemoveFromStall(this)">
					</td>
				</tr>
				`)
			}
		}
		
		for (let i = 0; aisleItemC[i] && i < 500; i++) {
			aff("Cobj val : " + aisleItemC[i].name+" objKey: "+Object.keys(aisleItemC[i]))
			if (typeof aisleItemC[i].name  !== 'undefined') {
				var stock = GetStockValueForItem(aisleItemC[i].name,itemStock)
				$('.tbodyMenuItemDescInStallC').append(`
				<tr class="eachListInStallC" id="IDaLaCon">
					<td class="ItemName">`+aisleItemC[i].name+`</td>
					<td class="ItemQteInShelves">`+aisleItemC[i].qte+`</td>
					<td class="ItemQteInStock">`+stock+`</td>
					<td class="Action">
						<input class="buttonStyle" type="button" id="`+aisleItemC[i].name+`" value="`+Trad["Trad-Remove"]+`" onclick="RemoveFromStall(this)">
					</td>
				</tr>
				`)
			}
		}
		
		for (let i = 0; aisleItemD[i] && i < 500; i++) {
			aff("Dobj val : " + Object.values(aisleItemD[i])+" objKey: "+Object.keys(aisleItemD[i]))
			if (typeof aisleItemD[i].name !== 'undefined') {
				var stock = GetStockValueForItem(aisleItemD[i].name,itemStock)
				$('.tbodyMenuItemDescInStallD').append(`
				<tr class="eachListInStallD" id="IDaLaCon">
					<td class="ItemName">`+aisleItemD[i].name+`</td>
					<td class="ItemQteInShelves">`+aisleItemD[i].qte+`</td>
					<td class="ItemQteInStock">`+stock+`</td>
					<td class="Action">
						<input class="buttonStyle" type="button" id="`+aisleItemD[i].name+`" value="`+Trad["Trad-Remove"]+`" onclick="RemoveFromStall(this)">
					</td>
				</tr>
				`)
			}
		}
		

		
	} else if (AisleDefineType== "Fixed") {
		$('.addItemDescMenuInStall').attr('id',id);
		$(".AisleDescInStall").val("a").change();
		$('.AisleDescInStall').prop( "disabled", true );
		$('.AisleCatA').attr('id',CatA);
		
		$('.AisleCatA').text(TradCatA);
		
		
		
		aff("A: "+TradCatA+" B: "+TradCatB+" C: "+TradCatC+" D: "+TradCatD)
		
		$('.MenuStockGlobal').fadeOut(500)
		$('.MenuEmployee').fadeOut(500)
		$('.MenuItemDesc').fadeOut(500)
		$('.MenuItemDescInShop').fadeOut(500)
		$('.MenuItemDescInStall').fadeIn(500)
		// $('.PlanContainer').fadeOut(500)
		$('.MenuPopupQTE').fadeOut(500)
		// toto = data
		// tempidStall = idStall
		// aff("id "+id+"   item "+item)
		$('.eachListInStallA').remove()
		// tempDATA = data
		for (let i = 0; aisleItemA[i] && i < 500; i++) {
			if (typeof aisleItemA[i].name !== 'undefined') {
				var stock = GetStockValueForItem(aisleItemA[i].name,itemStock)

				$('.tbodyMenuItemDescInStallA').append(`
				<tr class="eachListInStallA" id="IDaLaCon">
					<td class="ItemName">`+aisleItemA[i].name+`</td>
					<td class="ItemQteInShelves">`+aisleItemA[i].qte+`</td>
					<td class="ItemQteInStock">`+stock+`</td>
					<td class="Action">
						<input class="buttonStyle" type="button" id="`+aisleItemA[i].name+`" value="`+Trad["Trad-Remove"]+`" onclick="RemoveFromFixedStall(this)">
					</td>
				</tr>
				`)
				
			}
		}
		

	} else if (AisleDefineType== "Configurable") {
		$('.addItemDescMenuInStall').attr('id',id);
		$('.AisleDescInStall').prop( "disabled", false );
		
		$('.AisleCatA').attr('id',CatA);
		$('.AisleCatB').attr('id',CatB);
		$('.AisleCatC').attr('id',CatC);
		$('.AisleCatD').attr('id',CatD);
		
		$('.AisleCatA').text(TradCatA);
		$('.AisleCatB').text(TradCatB);
		$('.AisleCatC').text(TradCatC);
		$('.AisleCatD').text(TradCatD);
		aff("A: "+TradCatA+" B: "+TradCatB+" C: "+TradCatC+" D: "+TradCatD)
		
		$('.MenuStockGlobal').fadeOut(500)
		$('.MenuEmployee').fadeOut(500)
		$('.MenuItemDesc').fadeOut(500)
		$('.MenuItemDescInShop').fadeOut(500)
		$('.MenuItemDescInStall').fadeIn(500)
		// $('.PlanContainer').fadeOut(500)
		$('.MenuPopupQTE').fadeOut(500)
		// toto = data
		// tempidStall = idStall
		// aff("id "+id+"   item "+item)
		$('.eachListInStallA').remove()
		$('.eachListInStallB').remove()
		$('.eachListInStallC').remove()
		$('.eachListInStallD').remove()
		// tempDATA = data
		for (let i = 0; aisleItemA[i] && i < 500; i++) {
			if (typeof aisleItemA[i].name  !== 'undefined') {
				var stock = GetStockValueForItem(aisleItemA[i].name,itemStock)
				$('.tbodyMenuItemDescInStallA').append(`
				<tr class="eachListInStallA" id="IDaLaCon">
					<td class="ItemName">`+aisleItemA[i].name+`</td>
					<td class="ItemQteInShelves">`+aisleItemA[i].qte+`</td>
					<td class="ItemQteInStock">`+stock+`</td>
					<td class="Action">
						<input class="buttonStyle" type="button" id="`+aisleItemA[i].name+`" value="`+Trad["Trad-Remove"]+`" onclick="RemoveFromStall(this)">
					</td>
				</tr>
				`)
			}
		}
		
		for (let i = 0; aisleItemB[i] && i < 500; i++) {
			
			aff("Bobj val : " + Object.values(aisleItemB[i])+" objKey: "+Object.keys(aisleItemB[i]))
			if (typeof aisleItemB[i].name  !== 'undefined') {
				var stock = GetStockValueForItem(aisleItemB[i].name,itemStock)
			$('.tbodyMenuItemDescInStallB').append(`
			<tr class="eachListInStallB" id="IDaLaCon">
				<td class="ItemName">`+aisleItemB[i].name+`</td>
				<td class="ItemQteInShelves">`+aisleItemB[i].qte+`</td>
				<td class="ItemQteInStock">`+stock+`</td>
				<td class="Action">
					<input class="buttonStyle" type="button" id="`+aisleItemB[i].name+`" value="`+Trad["Trad-Remove"]+`" onclick="RemoveFromStall(this)">
				</td>
			</tr>
			`)
			}
		}
		
		for (let i = 0; aisleItemC[i] && i < 500; i++) {
			
			aff("Cobj val : " + aisleItemC[i].name+" objKey: "+Object.keys(aisleItemC[i]))
			if (typeof aisleItemC[i].name  !== 'undefined') {
				var stock = GetStockValueForItem(aisleItemC[i].name,itemStock)
				$('.tbodyMenuItemDescInStallC').append(`
				<tr class="eachListInStallC" id="IDaLaCon">
					<td class="ItemName">`+aisleItemC[i].name+`</td>
					<td class="ItemQteInShelves">`+aisleItemC[i].qte+`</td>
					<td class="ItemQteInStock">`+stock+`</td>
					<td class="Action">
						<input class="buttonStyle" type="button" id="`+aisleItemC[i].name+`" value="`+Trad["Trad-Remove"]+`" onclick="RemoveFromStall(this)">
					</td>
				</tr>
				`)
			}
		}
		
		for (let i = 0; aisleItemD[i] && i < 500; i++) {
			aff("Dobj val : " + Object.values(aisleItemD[i])+" objKey: "+Object.keys(aisleItemD[i]))
			if (typeof aisleItemD[i].name !== 'undefined') {
				var stock = GetStockValueForItem(aisleItemD[i].name,itemStock)
				$('.tbodyMenuItemDescInStallD').append(`
				<tr class="eachListInStallD" id="IDaLaCon">
					<td class="ItemName">`+aisleItemD[i].name+`</td>
					<td class="ItemQteInShelves">`+aisleItemD[i].qte+`</td>
					<td class="ItemQteInStock">`+stock+`</td>
					<td class="Action">
						<input class="buttonStyle" type="button" id="`+aisleItemD[i].name+`" value="`+Trad["Trad-Remove"]+`" onclick="RemoveFromStall(this)">
					</td>
				</tr>
				`)
			}
		}
	}
}

function GetDetailsItemDescInShop(itemId){
	aff("GetDetailsItemDescInShop"+itemId+" "+tempidStall)
	$.post('https://marketShop/GetDetailsItemDescInShop', JSON.stringify({itemId,tempidStall}));
}



function OpenMenuPlan(lstItem,traditem,itemtype,currentConf,currentFixed,currentRegular){
	ResetAllUI()
	$('.PlanContainer').fadeIn(500)
	
	$('.Shelve1ASizeType').remove()
	$('.Shelve1BSizeType').remove()
	$('.Shelve1CSizeType').remove()
	$('.Shelve1DSizeType').remove()
	$('.ShelveSizeType').remove()
	
	temp = document.createElement('option');
	temp.value = "none"
	temp.innerHTML = "None"
	temp.classList.add('Shelve1ASizeType')
	// temp.classList.add('Shelve1BSizeType')
	// temp.classList.add('Shelve1CSizeType')
	// temp.classList.add('Shelve1DSizeType')
	// temp.classList.add('ShelveSizeType')
	$('.shelveType').append(temp)
	$('.RegularshelveType').append(temp)
	// $('.shelveType#Aisle-'+'1A').append(temp)
	// $('.shelveType #Aisle-'+"1A").append(temp)
	
	lstItem.forEach(function (a, b) {
		// aff("a : "+a+" b: "+traditem[b]+itemtype[b])
		
		// $('.shelveType').append(temp)
		var toto = document.getElementsByClassName("shelveType")
		// aff("---------------------------------------")
		for (let i = 0; toto[i] && i < 500; i++) {
			
			temp = document.createElement('option');
			temp.value = a
			temp.innerHTML = traditem[b]
			if (itemtype[b] == "A") {
				temp.classList.add('Shelve1ASizeType')
				// temp.classList.add('ShelveSizeType')
				// aff("Add "+traditem[b]+" to ShelveSizeType")
			} else if (itemtype[b] == "D") {
				temp.classList.add('Shelve1DSizeType')
				// temp.classList.add('ShelveSizeType')
				// aff("Add "+traditem[b]+" to ShelveSizeType")
			} else if (itemtype[b] == "B") {
				temp.classList.add('Shelve1BSizeType')
				// temp.classList.add('ShelveSizeType')
				// aff("Add "+traditem[b]+" to ShelveSizeType")
			} else if (itemtype[b] == "C") {
				temp.classList.add('Shelve1CSizeType')
				// temp.classList.add('ShelveSizeType')
				// aff("Add "+traditem[b]+" to ShelveSizeType")
			}
			
			// aff("az fqfqqf : "+toto[i].id+"   "+ toto[i].id.search("-"+i+"A")+"   "+"-"+i+"A")
			// aff("div "+(Math.floor(i / 4) + 1))
			// aff("aez" + toto[i])
			var tempData = toto[i].id.split("-")[1]
			var withNoDigits = tempData.replace(/[0-9]/g, '');
			var curElement = toto[i]
			// aff("qrtempDatatempDatatempDatatempDatatempDatatempDatatempDatatempDatarq "+tempData)
			
			if (withNoDigits == "A" && (itemtype[b] == "A" || itemtype[b] == "D") ) { 
				// aff('shelveType#Aisle-'+tempData)
				$('.shelveType#Aisle-'+tempData).append(temp)
				
			} else if (withNoDigits == "B" && (itemtype[b] == "B" || itemtype[b] == "C")) {
				
				// aff('shelveType#Aisle-'+tempData)
				$('.shelveType#Aisle-'+tempData).append(temp)
				
			} else if (withNoDigits == "C" && (itemtype[b] == "B" || itemtype[b] == "C")) {
				
				// aff('shelveType#Aisle-'+tempData)
				$('.shelveType#Aisle-'+tempData).append(temp)
				
			} else if (withNoDigits == "D" && (itemtype[b] == "A" || itemtype[b] == "D")) {
				
				// aff('shelveType#Aisle-'+tempData)
				$('.shelveType#Aisle-'+tempData).append(temp)
			
			}else if (withNoDigits == "X"){
				// aff("Setting : "+tempData)
				$('.shelveType#Aisle-'+tempData).append(temp)
			}
			// toto[i].remove()
		}
		
		
		
		
		var tutu = document.getElementsByClassName("RegularshelveType")
		for (let i = 0; tutu[i] && i < 500; i++) {
			temp = document.createElement('option');
			temp.value = a
			temp.innerHTML = traditem[b]
			
			if (itemtype[b] == "A") {
				temp.classList.add('Shelve1ASizeType')
			} else if (itemtype[b] == "D") {
				temp.classList.add('Shelve1DSizeType')
			} else if (itemtype[b] == "B") {
				temp.classList.add('Shelve1BSizeType')
			} else if (itemtype[b] == "C") {
				temp.classList.add('Shelve1CSizeType')
			}
			
			var tempData = tutu[i].id.split("-")[1]

			// aff("qrtempDatatempDatatempDatatempDatatempDatatempDatatempDatatempDatarq "+tempData)
			

			$('.RegularshelveType#Aisle-'+tempData).append(temp)
			
		}
	});
	
	
	currentConf.forEach(function (a, b) {
		for (let i = 0; i < Object.keys(a).length; i++) {
			var Key = Object.keys(a)[i]
			var Value = Object.values(a)[i]
			
			if (Key == "id") {
				CurrentAisle = Value
			} else if (Key == "sizeOf") {
				CurrentAisleSize = Value
			}  else if (Key == "color") {
				CurrentAisleColor = Value
				
			} else if (Key == "Amodel") {
				if (Value == "bottlemedium") {
					CuurentAmodel = "medium"
				} else if (Value == "bottlelarge") {
					CuurentAmodel = "large"
				} else {
					CuurentAmodel = Value
				}
			} else if (Key == "Bmodel") {
				if (Value == "bottlemedium") {
					CuurentBmodel = "medium"
				} else if (Value == "bottlelarge") {
					CuurentBmodel = "large"
				} else {
					CuurentBmodel = Value
				}
			} else if (Key == "Cmodel") {
				if (Value == "bottlemedium") {
					CuurentCmodel = "medium"
				} else if (Value == "bottlelarge") {
					CuurentCmodel = "large"
				} else {
					CuurentCmodel = Value
				}
			} else if (Key == "Dmodel") {
				if (Value == "bottlemedium") {
					CuurentDmodel = "medium"
				} else if (Value == "bottlelarge") {
					CuurentDmodel = "large"
				} else {
					CuurentDmodel = Value
				}
				
			} else if (Key == "AtypeOf") {
				CuurentAtype = Value
			} else if (Key == "BtypeOf") {
				CuurentBtype = Value
			} else if (Key == "CtypeOf") {
				CuurentCtype = Value
			} else if (Key == "DtypeOf") {
				CuurentDtype = Value
			}
		}
		// aff("Set Size for "+CurrentAisle+" value : "+CuurentCmodel)
		$(".AisleSize#AisleSize-"+CurrentAisle).val(CurrentAisleSize).change();
		$(".AisleColor#AisleColor-"+CurrentAisle).val(CurrentAisleColor).change();
		
		$(".shelveSize#Aisle-"+CurrentAisle+"A").val(CuurentAmodel).change();
		$(".shelveSize#Aisle-"+CurrentAisle+"B").val(CuurentBmodel).change();
		$(".shelveSize#Aisle-"+CurrentAisle+"C").val(CuurentCmodel).change();
		$(".shelveSize#Aisle-"+CurrentAisle+"D").val(CuurentDmodel).change();
		
		$(".shelveType#Aisle-"+CurrentAisle+"A").val(CuurentAtype).change();
		$(".shelveType#Aisle-"+CurrentAisle+"B").val(CuurentBtype).change();
		$(".shelveType#Aisle-"+CurrentAisle+"C").val(CuurentCtype).change();
		$(".shelveType#Aisle-"+CurrentAisle+"D").val(CuurentDtype).change();
	});
	
	
	currentRegular.forEach(function (a, b) {
		for (let i = 0; i < Object.keys(a).length; i++) {
			// CurrentAisle = b
			var Key = Object.keys(a)[i]
			var Value = Object.values(a)[i]
			
			if (Key == "id") {
				CurrentAisle = Value
			} else if (Key == "sizeOf") {
				CurrentAisleSize = Value
			}  else if (Key == "color") {
				CurrentAisleColor = Value
				
			} else if (Key == "Amodel") {
				if (Value == "bottlemedium") {
					CuurentAmodel = "medium"
				} else if (Value == "bottlelarge") {
					CuurentAmodel = "large"
				} else {
					CuurentAmodel = Value
				}
			} else if (Key == "Bmodel") {
				if (Value == "bottlemedium") {
					CuurentBmodel = "medium"
				} else if (Value == "bottlelarge") {
					CuurentBmodel = "large"
				} else {
					CuurentBmodel = Value
				}
			} else if (Key == "Cmodel") {
				if (Value == "bottlemedium") {
					CuurentCmodel = "medium"
				} else if (Value == "bottlelarge") {
					CuurentCmodel = "large"
				} else {
					CuurentCmodel = Value
				}
			} else if (Key == "Dmodel") {
				if (Value == "bottlemedium") {
					CuurentDmodel = "medium"
				} else if (Value == "bottlelarge") {
					CuurentDmodel = "large"
				} else {
					CuurentDmodel = Value
				}
				
			} else if (Key == "AtypeOf") {
				CuurentAtype = Value
			} else if (Key == "BtypeOf") {
				CuurentBtype = Value
			} else if (Key == "CtypeOf") {
				CuurentCtype = Value
			} else if (Key == "DtypeOf") {
				CuurentDtype = Value
			}
		}
		
		$(".shelveType#Aisle-"+CurrentAisle+"A").val(CuurentAtype).change();
		$(".shelveType#Aisle-"+CurrentAisle+"B").val(CuurentBtype).change();
		$(".shelveType#Aisle-"+CurrentAisle+"C").val(CuurentCtype).change();
		$(".shelveType#Aisle-"+CurrentAisle+"D").val(CuurentDtype).change();
		
		$(".RegularshelveType#Aisle-"+CurrentAisle+"A").val(CuurentAtype).change();
		$(".RegularshelveType#Aisle-"+CurrentAisle+"B").val(CuurentBtype).change();
		$(".RegularshelveType#Aisle-"+CurrentAisle+"C").val(CuurentCtype).change();
		$(".RegularshelveType#Aisle-"+CurrentAisle+"D").val(CuurentDtype).change();
	});
	
	currentFixed.forEach(function (a, b) {
		for (let i = 0; i < Object.keys(a).length; i++) {
			// CurrentAisle = b
			var Key = Object.keys(a)[i]
			var Value = Object.values(a)[i]
			// aff("key : "+Key+" valeur: "+Value)
			if (Key == "id") {
				CurrentAisle = Value
			} else if (Key == "typeOf") {
				CuurentAtype = Value
				
			}
		}
		$(".shelveType#Aisle-"+CurrentAisle+"X").val(CuurentAtype).change();
	});

}

function ProductPlus(id) {
	// $('.MenuPopupStock').fadeOut(500)
	val = $("#"+id+".ProductQte").text()
	$("#"+id+".ProductQte").text(parseInt(val)+1)
	aff("ProductPlus: "+val)
}
function ProductMinus(id) {
	val = $("#"+id+".ProductQte").text()
	if ((val - 1)<=0) {
		
	} else {
	$("#"+id+".ProductQte").text(val-1)
	}
	// $('.MenuItemDescInStall').fadeOut(500)
}

function ProductTake(id,name) {
	qte = $("#"+id+".ProductQte").text()
	item = $("#"+id+".ProductCardTitle").text()
	aisle = $('.ProductContainerTitle').text()
	temp = aisle.split("-")[1]
	if (typeStall == "FixedStall") {
		if (temp.length>1) {
			aisleText = temp[0]+temp[1]
			shelveText = ""
		} else {
			aisleText = temp[0]
			shelveText = ""
		}
	} else {
		if (temp.length>2) {
			aisleText = temp[0]+temp[1]
			shelveText = temp[2]
		} else {
			aisleText = temp[0]
			shelveText = temp[1]
		}
	}
	aff("Take : "+qte+" "+item+" in : "+aisleText+" shelve: "+shelveText+" typeStall: "+typeStall)
	$.post('https://marketShop/TakeItemInShell', JSON.stringify({item : item, quantity : qte, aisle : aisleText, shelve : shelveText, typeStall : typeStall }));
}

function OpenProductContainer(itemIn,aislename) {
	ResetAllUI()

	
	
	
	$('.ProductContainer').fadeIn(500)
	$('.ProductCard').remove()
	aff("fgdssssssssssssssss   "+aislename)
	$('.ProductContainerTitle').text(aislename)
	
	itemIn.forEach(function (a, b) {
		if (a) {
		aff("a: "+a.name+" b: "+b+ " c: "+a.test)
		
		
		toto =
		'<div class="ProductCard">'+
						'<div class="ProductCardTitle" id="'+b+'">'+a.name+'</div>'+ 
						'<div class="ProductCardImage">'+
							'<div class="ProductPriceCard"><div class="ProductPrice">'+a.price+'$</div></div>'+
							'<div class="ProductAvailableCard"><div class="ProductAvailableText">'+Trad["Trad-Stock"]+' : '+a.qte+'</div></div>'+
							'<img src ="'+a.img+'"/>'+
						'</div>'+
						'<!-- <div class="ProductDesc">Une bouteille de vin aphrodisiaque qui baise des ponney sauvage de couleurs grise avec des petits voirt qui font la fete Une bouteille de vin aphrodisiaque qui baise des ponney sauvage de couleurs grise avec des petits voirt qui font la fete </div> -->'+
						'<div class="ProductButtonHeader">'+
							'<div class="ProductButton1">'+
								'<div class="ProductMinus" onclick="ProductMinus('+b+')">-</div>'+
								'<div class="ProductQte" id="'+b+'">5</div>'+
								'<div class="ProductPlus" onclick="ProductPlus('+b+')">+</div>'+
							'</div>'+
							'<div class="ProductButton2">'+
							// '<input class="ProductValidate" type="button" value="Take" onclick="TakeFromStock()">'+
								'<div class="ProductValidate"><div class="ProductValidateText"  onclick="ProductTake('+b+')">'+Trad["Trad-Take"]+'</div></div>'+
							'</div>'+
						'</div>'+
					'</div>'
		
		$('.ProductCardContainer').append(toto)
		
		
		}
		
		
	});
	
	
}

function CancelPopupStock() {
	$('.MenuPopupStock').fadeOut(500)
}
function CloseMenuItemDescInStall() {
	$('.MenuItemDescInStall').fadeOut(500)
}

function RemoveFromStall(data) {
	var aisle = $('.addItemDescMenuInStall').attr('id')
	var shelve = $('.AisleDescInStall').val()
	var item = data.id
	aff("aisle: "+aisle+" shelves: "+shelve+" item: "+item)
	$.post('https://marketShop/RemoveFromStall', JSON.stringify({item : item, aisle : aisle, shelve : shelve}));
}

function RemoveFromRegularStall(data) {
	var aisle = $('.addItemDescMenuInStall').attr('id')
	var shelve = $('.AisleDescInStall').val()
	var item = data.id
	aff("aisle: "+aisle+" shelves: "+shelve+" item: "+item)
	$.post('https://marketShop/RemoveFromRegularStall', JSON.stringify({item : item, aisle : aisle, shelve : shelve}));
}

function RemoveFromFixedStall(data) {
	var aisle = $('.addItemDescMenuInStall').attr('id')
	// var shelve = $('.AisleDescInStall').val()
	var item = data.id
	aff("aisle: "+aisle+" item: "+item)
	$.post('https://marketShop/RemoveFromFixedStall', JSON.stringify({item : item, aisle : aisle}));
}

function ValidatePopupStock() {
	var tempData = $('.hiddenDataStock').text()
	aff("tempData: "+tempData)
	var aisle = tempData.split("-")[0]
	var shelve = tempData.split("-")[1]
	var item = $('.MenuPopupStockSelect').val()
	aff("aisle: "+aisle+" shelves: "+shelve)
	
	
	$.post('https://marketShop/ValidatePopupStock', JSON.stringify({item : item, aisle : aisle, shelve : shelve, typeAisle : AisleDefineType}));
	CancelPopupStock()
}


function OpenStockSelect(listItemIn,aisle,shelves) {
	// ResetAllUI()

	$('.MenuPopupStock').fadeIn(500)
	
	aff("hiddenData : "+aisle+"-"+shelves)
	$('.hiddenDataStock').text("")
	$('.hiddenDataStock').text(aisle+"-"+shelves)
	$('.MenuPopupStockValue').remove()
	for (let i = 0; listItemIn[i] && i < 500; i++) {
		// aff("test item : "+listItemIn[i].name)
		$('.MenuPopupStockSelect').append(`<option class="MenuPopupStockValue" value="`+listItemIn[i].name+`">`+listItemIn[i].name+`</option>`)
		// $('.ProductCardContainer').append(toto)
	}
	
	
}

function OpenTrolleyItemList() {
	$('.TrolleyItemList').fadeIn(500)
}
function CloseTrolleyItemList() {
	$('.TrolleyItemList').fadeOut(500)
}
function UpdateTrolleyItemList(data) {
	// $('.TrolleyItemList').fadeIn(500)
	$('.TrolleyListItem').remove()
	for (let i = 0; data[i] && i < 500; i++) { 
		$('.tbodyTrolleyListItem').append(`
			<tr class="TrolleyListItem" id="IDaLaCon" >
				<td class="Name">`+data[i].name+`</td>
				<td class="Quantity">`+data[i].qte+`</td>
				<td class="BuyingPrice">`+data[i].price+`</td>
			</tr>
		`)
	}
}

function OpenBoxItemList() {
	$('.BoxItemList').fadeIn(500)
}
function CloseBoxItemList() {
	$('.BoxItemList').fadeOut(500)
	$('.BoxListItem').remove()
}
function UpdateBoxItemList(data) {
	$('.BoxItemList').fadeIn(500)
	$('.BoxListItem').remove()
	for (let i = 0; data[i] && i < 500; i++) { 
		$('.tbodyBoxListItem').append(`
			<tr class="BoxListItem" id="IDaLaCon" >
				<td class="Name">`+data[i].item+`</td>
				<td class="Quantity">`+data[i].qte+`</td>
			</tr>
		`)
	}
}

function ResetAllUI() {
	$('.CashRegister').fadeOut(500)                       
	$('.MenuStockGlobal').fadeOut(500)                          
	$('.MenuPopupQTE').fadeOut(500)                       
	$('.MenuPopupInfoValidate').fadeOut(500)              
	$('.MenuPopupStock').fadeOut(500)                     
	$('.MenuItemDesc').fadeOut(500)                       
	$('.ProductContainer').fadeOut(500)                   
	$('.MenuItemDescInStall').fadeOut(500)                
	$('.PlanContainer').fadeOut(500)                   
	$('.TrolleyItemList').fadeOut(500)  
}
function CloseAll(){
	
	$('.CashRegister').fadeOut(500)                       
	$('.MenuStockGlobal').fadeOut(500)                          
	$('.MenuPopupQTE').fadeOut(500)                       
	$('.MenuPopupInfoValidate').fadeOut(500)              
	$('.MenuPopupStock').fadeOut(500)                     
	$('.MenuItemDesc').fadeOut(500)                       
	$('.ProductContainer').fadeOut(500)                   
	$('.MenuItemDescInStall').fadeOut(500)                
	$('.PlanContainer').fadeOut(500)                      
	$('.TrolleyItemList').fadeOut(500)  
	// $('.MenuStock').fadeOut(500)
	// $('.MenuEmployee').fadeOut(500)
	// $('.MenuItemDesc').fadeOut(500)
	// $('.MenuItemDescInShop').fadeOut(500)
	// $('.MenuItemDescInStall').fadeOut(500)
	// $('.PlanContainer').fadeOut(500)
	// $('.MenuPopupQTE').fadeOut(500)
	// $('.MenuPopupInfoValidate').fadeOut(500)
	// $('.ProductContainer').fadeOut(500)
	// $('.CashRegister').fadeOut(500)
	currentIhmOpen = ""
	$.post('https://marketShop/exit', JSON.stringify({currentIhmOpen : currentIhmOpen}));
}
var Asking = 0
window.addEventListener("message", function(event) {
    var v = event.data  

// aff(document.getElementById('TradItem'))

// document.getElementById('TradItem').innerHTML = "Itemmmm"

	if (typeof Trad !== 'undefined') {
		// aff("2-Trad not defiend + "+ Trad)
	
	} else {
		aff("1-Trad not defiend + "+ Trad)
		Asking = Asking + 1
		if (Asking<3) {
			$.post('https://marketShop/AskForTrad', JSON.stringify({}));
		}
	}


    switch (v.action) {
		case 'Trad': 
			Trad = v.Trad
			// console.log("Trad key "+Trad["Trad-AvailItem"])
			for (const [key1, value1] of Object.entries(Trad)) {
				
				var elms = document.querySelectorAll("#"+key1);
 
				for(var i = 0; i < elms.length; i++) {
					// console.log("   TRAD key1: "+key1+" value1: "+value1+ " index: "+i + " type : "+elms[i].tagName.toLowerCase())
					if (key1 == "Trad-AisleName") {
						var tempAisle = elms[i].innerHTML
						// var temp2Aisle = tempAisle.replace(value1, '')
						//aff(tempAisle.search('Allée ') + " ------------------------------ ")
						if (tempAisle.search("Allée ") > -1) {
							elms[i].innerHTML = value1 +" "+ tempAisle.replace('Allée ', '')
						} else {
							elms[i].innerHTML = value1 +" "+ tempAisle.replace(value1, '')	
						}
					} else {						
						if (elms[i].tagName.toLowerCase() == "input") {
							elms[i].value = value1
						} else {
							elms[i].innerHTML = value1
						}
					}
				}
	
				// $("#"+key1).each(function(index) {
					// console.log("   TRAD key1: "+key1+" value1: "+value1+ " index: "+index )
					// $(this).text(value1)
				// });
				

			}
		break;
		
		case 'MenuStock': 
			var toto = v.data
			aff(toto)
			// for 
			OpenMenuStock(v.data)
        break;
		
		case 'CashReg': 
			var itemList = v.itemsList
			var itemListScanned = v.itemsListScanned
			var cashRegStatus = v.status
			cashRegCurrentHandle = v.handle
			cashRegCurrentType = v.typeCashReg
			// var cashRegHandle 
			aff("839 itemList "+itemList)
			aff("840 cashRegHandle "+cashRegCurrentHandle)
			// for 
			OpenCashReg(itemList,cashRegCurrentHandle,itemListScanned,cashRegStatus)
        break;
		
		case 'MenuEmployee': 
			OpenMenuEmployee()
        break;
		
		case 'MenuItemDesc': 
			var name = v.name
			var price = v.price
			var image = v.image
			var desc = v.desc
			
			
			OpenMenuItemDesc(name,price,image,desc)
        break;
		
		case 'InfoOrderText': 
			InfoOrderText(v.text,v.price)
        break;
		
		case 'MenuItemDescInShop': 
			var name = v.name
			var price = v.price
			var image = v.image
			var desc = v.desc
			OpenMenuItemDescInShop(name,price,image,desc)
        break;
		
		// case 'MenuItemDescInStall': 
			// var listItem = v.data.itemIn
			// var idStall = v.data.id
			// OpenMenuItemDescInStall(listItem,idStall)
        // break;
		
		case 'MenuPlan': 
			var currentConf = Object.values(JSON.parse(v.ihmConf))
			var currentFixed = Object.values(JSON.parse(v.ihmFixed))
			var currentRegular = Object.values(JSON.parse(v.ihmRegular))
			// var currentStock = Object.values(JSON.parse(v.ihmStock))
			OpenMenuPlan(v.dataCat,v.dataTrad,v.dataType,currentConf,currentFixed,currentRegular)
			
			// CurrentConfig 
			
				// a.forEach(function (c, d) {
				// aff("c : "+c+" d: "+d)
				// });
			// });
        break;
		
		case 'OpenItemStall':
			currentIhmOpen="OpenItemStall"
			typeStall = v.typeStall
			var listItemIn = Object.values(JSON.parse(v.listItemIn))
			var AisleName = v.AisleName
			OpenProductContainer(listItemIn,AisleName)
		break;
		
		case 'MenuAisleDefine':
			// 
			var aisle = v.data
			
			AisleDefineType = v.typeAisle
			itemStock = Object.values(JSON.parse(v.allItemStock))
			if (v.typeAisle == "Regular") {
				var aisleItemA = Object.values(JSON.parse(v.itemA))
				var aisleItemB = Object.values(JSON.parse(v.itemB))
				var aisleItemC = Object.values(JSON.parse(v.itemC))
				var aisleItemD = Object.values(JSON.parse(v.itemD))
				
				var itemStock = Object.values(JSON.parse(v.allItemStock))
				
				var CatA = v.CatA
				var CatB = v.CatB
				var CatC = v.CatC
				var CatD = v.CatD
				
				var TradCatA = v.TradCatA
				var TradCatB = v.TradCatB
				var TradCatC = v.TradCatC
				var TradCatD = v.TradCatD
				
				OpenMenuItemDescInStall(aisle,aisleItemA,aisleItemB,aisleItemC,aisleItemD,CatA,CatB,CatC,CatD,TradCatA,TradCatB,TradCatC,TradCatD,itemStock)
			}else if (v.typeAisle == "Fixed") {
				var aisleItemA = Object.values(JSON.parse(v.itemA))
				var CatA = v.CatA
				
				var TradCatA = v.TradCatA
				aff("MenuAisleDefine Fixed")
				OpenMenuItemDescInStall(aisle,aisleItemA,aisleItemB,aisleItemC,aisleItemD,CatA,CatB,CatC,CatD,TradCatA,TradCatB,TradCatC,TradCatD,itemStock)
			
			}else if (v.typeAisle == "Configurable") {
				var aisleItemA = Object.values(JSON.parse(v.itemA))
				var aisleItemB = Object.values(JSON.parse(v.itemB))
				var aisleItemC = Object.values(JSON.parse(v.itemC))
				var aisleItemD = Object.values(JSON.parse(v.itemD))
				var CatA = v.CatA
				var CatB = v.CatB
				var CatC = v.CatC
				var CatD = v.CatD
				
				var TradCatA = v.TradCatA
				var TradCatB = v.TradCatB
				var TradCatC = v.TradCatC
				var TradCatD = v.TradCatD
				
				OpenMenuItemDescInStall(aisle,aisleItemA,aisleItemB,aisleItemC,aisleItemD,CatA,CatB,CatC,CatD,TradCatA,TradCatB,TradCatC,TradCatD,itemStock)
			}
		break;
		
		
		case 'OpenStockSelect':
			var listItemStockSelect =  Object.values(JSON.parse(v.listItemIn))
			var aisle = v.aisle
			var shelves = v.shelves
			aff("OpenStockSelect aisle :"+aisle+" shelves :"+shelves)
			OpenStockSelect(listItemStockSelect,aisle,shelves)
		break;
		
		case 'PrintIhmTicket':
			JSprintTicket(v.data)
		break;
		
		
		case 'OpenTrolleyItemList': 
			OpenTrolleyItemList()
        break;
		case 'CloseTrolleyItemList': 
			CloseTrolleyItemList()
        break;
		case 'UpdateTrolleyList': 
			UpdateTrolleyItemList(v.data)
        break;
		
		
		case 'OpenBoxItemList': 
			OpenBoxItemList()
        break;
		case 'CloseBoxItemList': 
			CloseBoxItemList()
        break;
		case 'UpdateBoxList': 
			UpdateBoxItemList(v.data)
        break;
		
		
		case 'BipScan': 
			
			$('#beep').prop("volume", v.volume);
			$('#beep').trigger("play");
        break;
		
		case 'BipPrint': 
			// v.volume
			$('#ticketprint').prop("volume", v.volume);
			$('#ticketprint').trigger("play");
        break;
		
		case 'BipPaid': 
			// v.volume
			$('#paid').prop("volume", v.volume);
			$('#paid').trigger("play");
        break;
		
		
		
		case 'Close':
			CloseAll()
		break;
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
        case 'Accueil': 
             // $('.MenuContainer').fadeIn(500)
			 CurrentPseudo = v.username
			 aff("Accueil pseudo "+CurrentPseudo)
			 OpenAcceuil()
        break;

        
		
		case 'quit':
			CloseAll()
		break;

    }
});

$(document).keyup((e) => {
    if (e.key === "Escape") {
        CloseAll()
    }
});

function shelveTypeChange(data){
	
}

function FixedShelveTypeChange(data){
	
}

function SaveAisle(data){
	var aisle = data.id
	var splittedAisle = aisle.split('-');
	
	var AisleSize = 0
	var AisleColor = "blue"
	
	var ShelveASize = 0
	var ShelveBSize = 0
	var ShelveCSize = 0
	var ShelveDSize = 0
	
	var ShelveAType = 0
	var ShelveBType = 0
	var ShelveCType = 0
	var ShelveDType = 0
	
	aff("splitted aisle : "+splittedAisle[1])
	
	var toto = document.getElementById("AisleSize-"+splittedAisle[1])
	var value = toto.value
	var text = toto.options[toto.selectedIndex].text;
	
	aff("AisleSize : "+value+" : "+text)
	AisleSize = value
	
	var toto = document.getElementById("AisleColor-"+splittedAisle[1])
	var value = toto.value
	var text = toto.options[toto.selectedIndex].text;
	
	aff("AisleColor : "+value+" : "+text)
	AisleColor = value
	
	var toto = document.getElementsByClassName("shelveSize")
	for (let i = 0; toto[i] && i < 500; i++) {
		if (toto[i].id.search("-"+splittedAisle[1]+"A") != -1) { 
			// ShelveASize = toto[i].value
			ShelveASize = toto[i].value
			aff("shelveA : "+ShelveASize)
		} else if (toto[i].id.search("-"+splittedAisle[1]+"B") != -1) {
			ShelveBSize = toto[i].value
			aff("shelveB : "+ShelveBSize)
		} else if (toto[i].id.search("-"+splittedAisle[1]+"C") != -1) {
			ShelveCSize = toto[i].value
			aff("shelveC : "+ShelveCSize)
		} else if (toto[i].id.search("-"+splittedAisle[1]+"D") != -1) {
			ShelveDSize = toto[i].value
			aff("shelveD : "+ShelveDSize)
		}
	}
	
	var toto = document.getElementsByClassName("shelveType")
	for (let i = 0; toto[i] && i < 500; i++) {
		if (toto[i].id.search("-"+splittedAisle[1]+"A") != -1) { 
			// ShelveASize = toto[i].value
			ShelveAType = toto[i].value
			aff("shelveA : "+ShelveAType)
		} else if (toto[i].id.search("-"+splittedAisle[1]+"B") != -1) {
			ShelveBType = toto[i].value
			aff("shelveB : "+ShelveBType)
		} else if (toto[i].id.search("-"+splittedAisle[1]+"C") != -1) {
			ShelveCType = toto[i].value
			aff("shelveC : "+ShelveCType)
		} else if (toto[i].id.search("-"+splittedAisle[1]+"D") != -1) {
			ShelveDType = toto[i].value
			aff("shelveD : "+ShelveDType)
		}
	}
	
	$.post('https://marketShop/SaveAisle', JSON.stringify({
		AisleId : splittedAisle[1], 
		AisleSize : AisleSize,
		AisleColor : AisleColor,
		ShelveASize: ShelveASize,
		ShelveAType: ShelveAType,
		ShelveBSize: ShelveBSize,
		ShelveBType: ShelveBType,
		ShelveCSize: ShelveCSize,
		ShelveCType: ShelveCType,
		ShelveDSize: ShelveDSize,
		ShelveDType: ShelveDType,
		}));
}


function SaveRegularAisle(data){
	var aisle = data.id
	var splittedAisle = aisle.split('-');
	
	// var AisleSize = 0
	// var AisleColor = "blue"
	
	// var ShelveASize = 0
	// var ShelveBSize = 0
	// var ShelveCSize = 0
	// var ShelveDSize = 0
	
	var ShelveAType = 0
	var ShelveBType = 0
	var ShelveCType = 0
	var ShelveDType = 0
	
	aff("splitted aisle : "+splittedAisle[1])
	
	// var toto = document.getElementById("AisleSize-"+splittedAisle[1])
	// var value = toto.value
	// var text = toto.options[toto.selectedIndex].text;
	
	// aff("AisleSize : "+value+" : "+text)
	// AisleSize = value
	
	// var toto = document.getElementById("AisleColor-"+splittedAisle[1])
	// var value = toto.value
	// var text = toto.options[toto.selectedIndex].text;
	
	// aff("AisleColor : "+value+" : "+text)
	// AisleColor = value
	
	// var toto = document.getElementsByClassName("shelveSize")
	// for (let i = 0; toto[i] && i < 500; i++) {
		// if (toto[i].id.search("-"+splittedAisle[1]+"A") != -1) { 
			
			// ShelveASize = toto[i].value
			// aff("shelveA : "+ShelveASize)
		// } else if (toto[i].id.search("-"+splittedAisle[1]+"B") != -1) {
			// ShelveBSize = toto[i].value
			// aff("shelveB : "+ShelveBSize)
		// } else if (toto[i].id.search("-"+splittedAisle[1]+"C") != -1) {
			// ShelveCSize = toto[i].value
			// aff("shelveC : "+ShelveCSize)
		// } else if (toto[i].id.search("-"+splittedAisle[1]+"D") != -1) {
			// ShelveDSize = toto[i].value
			// aff("shelveD : "+ShelveDSize)
		// }
	// }
	
	var toto = document.getElementsByClassName("RegularshelveType")
	for (let i = 0; toto[i] && i < 500; i++) {
		if (toto[i].id.search("-"+splittedAisle[1]+"A") != -1) { 
			
			ShelveAType = toto[i].value
			aff("shelveA : "+ShelveAType)
		} else if (toto[i].id.search("-"+splittedAisle[1]+"B") != -1) {
			ShelveBType = toto[i].value
			aff("shelveB : "+ShelveBType)
		} else if (toto[i].id.search("-"+splittedAisle[1]+"C") != -1) {
			ShelveCType = toto[i].value
			aff("shelveC : "+ShelveCType)
		} else if (toto[i].id.search("-"+splittedAisle[1]+"D") != -1) {
			ShelveDType = toto[i].value
			aff("shelveD : "+ShelveDType)
		}
	}
	
	$.post('https://marketShop/SaveRegularAisle', JSON.stringify({
		AisleId : splittedAisle[1], 
		// AisleSize : AisleSize,
		// AisleColor : AisleColor,
		// ShelveASize: ShelveASize,
		ShelveAType: ShelveAType,
		// ShelveBSize: ShelveBSize,
		ShelveBType: ShelveBType,
		// ShelveCSize: ShelveCSize,
		ShelveCType: ShelveCType,
		// ShelveDSize: ShelveDSize,
		ShelveDType: ShelveDType,
		}));
}

function SaveFixedAisle(data){
	var aisle = data.id
	var splittedAisle = aisle.split('-');
	

	var ShelveAType = 0
	
	aff("splitted aisle : "+splittedAisle[1])
	
	
	var toto = document.getElementsByClassName("shelveType")
	for (let i = 0; toto[i] && i < 500; i++) {
		if (toto[i].id.search("-"+splittedAisle[1]+"X") != -1) { 
			
			ShelveAType = toto[i].value
			aff("shelveA : "+ShelveAType)
		} else if (toto[i].id.search("-"+splittedAisle[1]+"B") != -1) {
			ShelveBType = toto[i].value
			aff("shelveB : "+ShelveBType)
		} else if (toto[i].id.search("-"+splittedAisle[1]+"C") != -1) {
			ShelveCType = toto[i].value
			aff("shelveC : "+ShelveCType)
		} else if (toto[i].id.search("-"+splittedAisle[1]+"D") != -1) {
			ShelveDType = toto[i].value
			aff("shelveD : "+ShelveDType)
		}
	}
	
	$.post('https://marketShop/SaveFixedAisle', JSON.stringify({
		AisleId : splittedAisle[1], 
		// AisleSize : AisleSize,
		// AisleColor : AisleColor,
		// ShelveASize: ShelveASize,
		ShelveAType: ShelveAType,
		// ShelveBSize: ShelveBSize,
		// ShelveBType: ShelveBType,
		// ShelveCSize: ShelveCSize,
		// ShelveCType: ShelveCType,
		// ShelveDSize: ShelveDSize,
		// ShelveDType: ShelveDType,
		}));
}

function AisleSizeChange(data) {
	var aisle = data.id
	var splittedAisle = aisle.split('-');
	// aff("splitted aisle :-"+splittedAisle[1]+"-"+data.value)
	var currentAisle = splittedAisle[1]
	
	toto = document.getElementsByClassName("shelveSize")
	for (let i = 0; toto[i] && i < 500; i++) {
		titi = toto[i].options
		for (let j = 0; titi[j] && j < 500 ; j++) {
			// aff("4 : "+toto[i].options+" -------- "+toto[i].id)
			if (toto[i].id.search("-"+currentAisle+"A") != -1 || toto[i].id.search("-"+currentAisle+"B") != -1 || toto[i].id.search("-"+currentAisle+"C") != -1 || toto[i].id.search("-"+currentAisle+"D") != -1) {
				titi = toto[i].options
				
				for (let j = 0; titi[j] && j < 50 ; j++) {
					// aff("5 : "+titi[j].className)
					if (titi[j].value == "large") {
						if (data.value == "medium") {
							titi[j].hidden = true
						} else {
							titi[j].hidden = false
						}
					}
				}
			}
		}
	}
}

function shelveSizeChange(data) {
	var aisle = data.id
	var splittedAisle = aisle.split('-');
	// aff(splittedAisle)
	var toto = splittedAisle[1].split(/(\d+)/)
	// aff("xvx "+toto[1]+" "+toto[2])
	var CurrentAisle = toto[1]
	var AisleLetter = toto[2]
	
	toto = document.getElementsByClassName("shelve"+AisleLetter+"StockSizeValue")

	for (let i = 0; toto[i] && i < 500; i++) {
		// aff("fdgdr id : "+toto[i].id)
		if (toto[i].id == "Aisle-"+CurrentAisle+AisleLetter) {
			// aff("set value :"+data.value)
			if (data.value == "large") {
				toto[i].innerHTML = 100
			}else if (data.value == "medium") {
				toto[i].innerHTML = 50
			}else {
				toto[i].innerHTML = 100
			}
		}
	}
}

function DefineAisle(data) {
	
	var id = 0
	id = data.className.split('-')[4]
	aff("class "+id)
	
	$.post('https://marketShop/GetAisleStock', JSON.stringify({id : id}));
}

function DefineRegularAisle(data) {
	
	var id = 0
	id = data.className.split('-')[4]
	aff("class "+id)
	
	$.post('https://marketShop/GetRegularAisleStock', JSON.stringify({id : id}));
}

function DefineFixedAisle(data) {
	
	var id = 0
	id = data.className.split('-')[4]
	aff("class "+id)
	
	$.post('https://marketShop/GetFixedAisleStock', JSON.stringify({id : id}));
}

function AisleDescInStallChange(data) {
	aff("aezazezaeezaaezeaz "+data.value)
	
	if (data.value == "a") {
		
		$('.AisleCatB').fadeOut(250)
		$('.AisleCatC').fadeOut(250)
		$('.AisleCatD').fadeOut(250)
		$('.AisleDescInStallAisleB').fadeOut(250)
		$('.AisleDescInStallAisleC').fadeOut(250)
		$('.AisleDescInStallAisleD').fadeOut(250)
		
		setTimeout(function(){
			$('.AisleCatA').fadeIn(250)
			$('.AisleDescInStallAisleA').fadeIn(250)
		}, 255)
		
	} else if (data.value == "b") {
		
		$('.AisleCatA').fadeOut(250)
		$('.AisleCatC').fadeOut(250)
		$('.AisleCatD').fadeOut(250)
		$('.AisleDescInStallAisleA').fadeOut(250)
		$('.AisleDescInStallAisleC').fadeOut(250)
		$('.AisleDescInStallAisleD').fadeOut(250)
		
		setTimeout(function(){
			$('.AisleCatB').fadeIn(250)
			$('.AisleDescInStallAisleB').fadeIn(250)
		}, 255)
		
	} else if (data.value == "c") {
		
		$('.AisleCatB').fadeOut(250)
		$('.AisleCatA').fadeOut(250)
		$('.AisleCatD').fadeOut(250)
		$('.AisleDescInStallAisleA').fadeOut(250)
		$('.AisleDescInStallAisleB').fadeOut(250)
		$('.AisleDescInStallAisleD').fadeOut(250)
		
		setTimeout(function(){
			$('.AisleCatC').fadeIn(250)
			$('.AisleDescInStallAisleC').fadeIn(250)
		}, 255)
		
	} else if (data.value == "d") {
		
		$('.AisleCatB').fadeOut(250)
		$('.AisleCatC').fadeOut(250)
		$('.AisleCatA').fadeOut(250)
		$('.AisleDescInStallAisleA').fadeOut(250)
		$('.AisleDescInStallAisleB').fadeOut(250)
		$('.AisleDescInStallAisleC').fadeOut(250)
		
		setTimeout(function(){
			$('.AisleCatD').fadeIn(250)
			$('.AisleDescInStallAisleD').fadeIn(250)
		}, 255)
		
	}
}


function AddMenuItemDescInStall(data) {
	if (AisleDefineType == "Configurable") {
		var elmId = $(data).attr("id");
		var aisle = $(".AisleDescInStall").val()
		
		if (aisle == "a") {
			var cat = $(".AisleCatA").attr("id");
		} else if (aisle == "b") {
			var cat = $(".AisleCatB").attr("id");
		} else if (aisle == "c") {
			var cat = $(".AisleCatC").attr("id");
		} else if (aisle == "d") {
			var cat = $(".AisleCatD").attr("id");
		}
		aff("add to : "+elmId+"-"+aisle+" cat: "+cat)
		$.post('https://marketShop/AskForADDitemInStall', JSON.stringify({aisle : elmId, shelves : aisle, cat : cat, typeAisle : AisleDefineType}));
	}else if (AisleDefineType == "Regular") {
		var elmId = $(data).attr("id");
		var aisle = $(".AisleDescInStall").val()
		
		if (aisle == "a") {
			var cat = $(".AisleCatA").attr("id");
		} else if (aisle == "b") {
			var cat = $(".AisleCatB").attr("id");
		} else if (aisle == "c") {
			var cat = $(".AisleCatC").attr("id");
		} else if (aisle == "d") {
			var cat = $(".AisleCatD").attr("id");
		}
		aff("add to : "+elmId+"-"+aisle+" cat: "+cat)
		$.post('https://marketShop/AskForADDitemInStall', JSON.stringify({aisle : elmId, shelves : aisle, cat : cat, typeAisle : AisleDefineType}));
	}else if (AisleDefineType == "Fixed") {
		var elmId = $(data).attr("id");
		var aisle = $(".AisleDescInStall").val()
		
		if (aisle == "a") {
			var cat = $(".AisleCatA").attr("id");
		// } else if (aisle == "b") {
			// var cat = $(".AisleCatB").attr("id");
		// } else if (aisle == "c") {
			// var cat = $(".AisleCatC").attr("id");
		// } else if (aisle == "d") {
			// var cat = $(".AisleCatD").attr("id");
		}
		aff("add to : "+elmId+"-"+aisle+" cat: "+cat)
		$.post('https://marketShop/AskForADDitemInStall', JSON.stringify({aisle : elmId, shelves : aisle, cat : cat, typeAisle : AisleDefineType}));
	
	}
}