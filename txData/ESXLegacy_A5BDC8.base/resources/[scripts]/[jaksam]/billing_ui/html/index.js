var maxAmount = null;
var maxReasonCharacter = null;
var allowCustomAmounts = null;
var allowCustomReasons = null;

function setupLanguage(language){
	$("#invoice-tab").text(language["invoice"]);
	$("#amounts-tab").text(language["amount"]);
	$("#reasons-tab").text(language["reasons"]);

	$("#target-label").text(language["customer_id"]);
	$("#target-id-help").text(language["player_server_id"]);

	$("#invoice-amount-label").text(language["invoice_amount"]);
	$("#premade-amounts").text(language["premade"]);

	$("#invoice-reason-label").text(language["invoice_reason"]);
	$("#premade-reasons").text(language["premade"]);

	$("#include-jobname-label").text(language["include_jobname"]);

	$("#create-invoice-btn").text(language["create_invoice"]);

	$("#target_type_player-label").text(language["you_receive_money"]);
	$("#target_type_society-label").text(language["society_receives_money"]);
}

function setupConfig(config){
	$("#invoice-amount").prop( "disabled", !config.allowCustomAmounts);
	$("#invoice-reason").prop( "disabled", !config.allowCustomReasons);

	if(!config.allowCustomAmounts) {
		$("#amounts-tab").hide();
	}

	if(!config.allowCustomReasons) {
		$("#reasons-tab").hide();
	}

	$("#target_type_player").prop("disabled", config.exclusiveBilling)

	maxAmount = config.maxAmount
	maxReasonCharacter = config.maxReasonCharacter
}

function fillCustomReasons(reasons){
	var mainContent = $("#reason-btns-container");

	mainContent.empty();

	if(reasons.length > 0) {
		reasons.forEach(reason => {
			var reasonBtn = $(`<button class="btn btn-outline-danger" type="button" data-reason="${reason}">${reason}</button>`);
			
			reasonBtn.click(function(){
				$.post(`https://${GetParentResourceName()}/remove-custom`, JSON.stringify({toRemove: $(this).data("reason")}));
				$(this).remove();
			})
	
			mainContent.append(reasonBtn);
		})
	}

	mainContent.append(`
		<div class="input-group mt-4">
			<input id="new-reason-input" type="text" class="form-control" placeholder="New reason" aria-label="New reason" aria-describedby="new-reason-btn">
			<button class="btn btn-outline-secondary" type="button" id="new-reason-btn">Add</button>
		</div>
	`);

	$("#new-reason-btn").unbind();
	$("#new-reason-btn").click(function(){
		var reasonInput = $("#new-reason-input");
		var newReason = reasonInput.val();

		if(newReason) {
			reasonInput.val("");
			
			$.post(`https://${GetParentResourceName()}/new-custom-reason`, JSON.stringify({reason: newReason}));
			
			let allReasons = $("#reason-btns-container").children("button")
			let length = allReasons.length
			
			if(length > 0) {
				let allReasonsArr = [];

				allReasons.each(function(index, element){
	
					var reason = $(element).data("reason");
					if(reason) {
						allReasonsArr.push(reason)
					}
	
					if(index == length-1) {
						allReasonsArr.push(newReason)
						fillCustomReasons(allReasonsArr);
					}
				})
			} else {
				fillCustomReasons([newReason])
			}

			var premadeReasons = $("#premade-reasons-content");

			var reasonBtn = $(`<li><a class="dropdown-item" href="#" data-reason="${newReason}">${newReason}</a></li>`);

			reasonBtn.click(function() {
				$("#invoice-reason").val($(this).find(".dropdown-item").data("reason"))
			})

			premadeReasons.append(reasonBtn);
		} else {
			reasonInput.addClass("is-invalid");
		}
	})
}

function fillCustomAmounts(amounts){
	var mainContent = $("#amount-btns-container");

	mainContent.empty();

	var formatter = new Intl.NumberFormat('en-US', {
		style: 'currency',
		currency: 'USD',
		minimumFractionDigits: 0,
		maximumFractionDigits: 0,
	});

	if(amounts.length > 0) {
		amounts.forEach(amount => {
			let amountFormatted = formatter.format(amount)
			var amountBtn = $(`<button class="btn btn-outline-danger" type="button" data-amount="${amount}">${amountFormatted}</button>`);
			
			amountBtn.click(function(){
				$.post(`https://${GetParentResourceName()}/remove-custom`, JSON.stringify({toRemove: $(this).data("amount")}));
				$(this).remove();
			})
	
			mainContent.append(amountBtn);
		})
	}

	mainContent.append(`
		<div class="input-group mt-4">
			<span class="input-group-text">$</span>
			<input id="new-amount-input" type="number" class="form-control" placeholder="New amount" aria-label="New amount" aria-describedby="new-amount-btn">
			<button class="btn btn-outline-secondary" type="button" id="new-amount-btn">Add</button>
		</div>
	`);

	$("#new-amount-btn").unbind();
	$("#new-amount-btn").click(function(){
		var amountInput = $("#new-amount-input");
		var newAmount = amountInput.val();

		if(newAmount == parseInt(newAmount)) {
			amountInput.val("");
			
			$.post(`https://${GetParentResourceName()}/new-custom-amount`, JSON.stringify({amount: newAmount}));
			
			let allAmounts = $("#amount-btns-container").children("button")
			let length = allAmounts.length
			
			if(length > 0) {
				let allAmountsArr = [];

				allAmounts.each(function(index, element){
	
					var amount = $(element).data("amount");
					if(amount) {
						allAmountsArr.push(amount)
					}
	
					if(index == length-1) {
						allAmountsArr.push(newAmount)
						fillCustomAmounts(allAmountsArr);
					}
				})
			} else {
				fillCustomAmounts([newAmount])
			}

			var premadeAmounts = $("#premade-amounts-content");

			var amountBtn = $(`<li><a class="dropdown-item" href="#" data-amount="${newAmount}">${newAmount}</a></li>`)

			amountBtn.click(function() {
				$("#invoice-amount").val($(this).find(".dropdown-item").data("amount"))
			})

			premadeAmounts.append(amountBtn);
		} else {
			amountInput.addClass("is-invalid");
		}
	})
}

function fillPremadeAmounts(defaultAmounts, customAmounts) {
	var premadeAmounts = $("#premade-amounts-content");
	
	premadeAmounts.empty();

	var formatter = new Intl.NumberFormat('en-US', {
		style: 'currency',
		currency: 'USD',
		minimumFractionDigits: 0,
		maximumFractionDigits: 0,
	});

	if(defaultAmounts && defaultAmounts.length > 0) {
		defaultAmounts.forEach(amount => {
			let amountFormatted = formatter.format(amount);
			var amountBtn = $(`<li><a class="dropdown-item" href="#" data-amount="${amount}">${amountFormatted}</a></li>`)

			amountBtn.click(function() {
				$("#invoice-amount").val($(this).find(".dropdown-item").data("amount"))
			})

			premadeAmounts.append(amountBtn)
		})
	}

	if( (defaultAmounts && defaultAmounts.length > 0) && (customAmounts && customAmounts.length > 0) ){
		premadeAmounts.append(`<li><hr class="dropdown-divider"></li>`)
	}

	if(customAmounts && customAmounts.length > 0) {
		customAmounts.forEach(amount => {
			let amountFormatted = formatter.format(amount);
			var amountBtn = $(`<li><a class="dropdown-item" href="#" data-amount="${amount}">${amountFormatted}</a></li>`)

			amountBtn.click(function() {
				$("#invoice-amount").val($(this).find(".dropdown-item").data("amount"))
			})

			premadeAmounts.append(amountBtn)
		})
	}
}

function fillPremadeReasons(defaultReasons, customReasons) {
	var premadeReasons = $("#premade-reasons-content");
	
	premadeReasons.empty();

	if(defaultReasons && defaultReasons.length > 0) {
		defaultReasons.forEach(reason => {
			var reasonBtn = $(`<li><a class="dropdown-item" href="#" data-reason="${reason}">${reason}</a></li>`)

			reasonBtn.click(function() {
				$("#invoice-reason").val($(this).find(".dropdown-item").data("reason"))
			})

			premadeReasons.append(reasonBtn)
		})
	}

	if( (defaultReasons && defaultReasons.length > 0) && (customReasons && customReasons.length > 0)){
		premadeReasons.append(`<li><hr class="dropdown-divider"></li>`)
	}

	if(customReasons && customReasons.length > 0) {
		customReasons.forEach(reason => {
			var reasonBtn = $(`<li><a class="dropdown-item" href="#" data-reason="${reason}">${reason}</a></li>`)

			reasonBtn.click(function() {
				$("#invoice-reason").val($(this).find(".dropdown-item").data("reason"))
			})

			premadeReasons.append(reasonBtn)
		})
	}
}

function createBill(targetId, defaultAmounts, defaultReasons, customAmounts, customReasons){
	$("#target-id").val(targetId);

	fillCustomAmounts(customAmounts);
	fillCustomReasons(customReasons);

	$("#invoice-amount").val(defaultAmounts.default);
	$("#invoice-reason").val(defaultReasons.default);

	fillPremadeAmounts(defaultAmounts.otherAmounts, customAmounts);
	fillPremadeReasons(defaultReasons.otherReasons, customReasons);
	
	$("#billing-ui").show();
}

function cancelBill(){
	$("#billing-ui").hide();
}

$("#close-billing-btn").click(function(){
	cancelBill()
	$.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
})

$("#create-invoice-btn").click(function(e){
	e.preventDefault();
	
	let isEverythingValid = true

	var targetId = $("#target-id").val();
	var amount = parseInt($("#invoice-amount").val());
	var reason = $("#invoice-reason").val();
	var includeJobName = $("#invoice-include-jobname").prop("checked");

	if(!targetId) {
		$("#target-id").addClass("is-invalid");
		isEverythingValid = false
	} else {
		$("#target-id").removeClass("is-invalid");
	}

	if(!amount || (maxAmount && amount > maxAmount)) {
		$("#invoice-amount").addClass("is-invalid");
		isEverythingValid = false
	} else {
		$("#invoice-amount").removeClass("is-invalid");
	}
	
	if(!reason || (maxReasonCharacter && reason.length > maxReasonCharacter)) {
		$("#invoice-reason").addClass("is-invalid");
		isEverythingValid = false
	} else {
		$("#invoice-reason").removeClass("is-invalid");
	}

	if(isEverythingValid) {
		cancelBill()
	
		if($("#target_type_society").prop("checked")) {
			var target = "society";
		} else if($("#target_type_player").prop("checked")) {
			var target = "player";
		}

		$.post(`https://${GetParentResourceName()}/bill`, JSON.stringify({
			id: targetId,
			amount: amount,
			reason: reason,
			includeJobName: includeJobName,
			targetType: target
		}));
	}
})

// Shows "include job name" when target_type is society
$('input[type=radio][name=target_type]').change(function() {
    let targetType = $(this).val();

	let includeJobNameDiv = $("#include-jobname-div");

	if(targetType === "society") {
		$("#invoice-include-jobname").prop("checked", true);
		includeJobNameDiv.show();
	} else {
		$("#invoice-include-jobname").prop("checked", false);
		includeJobNameDiv.hide();
	}
});

window.addEventListener('message', (event) => {
	switch(event.data.type){
		case 'createBill':
			createBill(
				event.data.targetId,
				event.data.defaultAmounts,
				event.data.defaultReasons,
				event.data.customOptions.amounts,
				event.data.customOptions.reasons);
			break;

		case 'setupConfig':
			setupConfig(event.data.config);
			setupLanguage(event.data.language);
			break;
	}
});

document.onkeyup = function (data) {
	if (data.key == "Escape") {
		cancelBill()
		$.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
		return
	}
};