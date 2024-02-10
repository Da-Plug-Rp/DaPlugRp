const resName = GetParentResourceName();

const DOORS_COLORS = {
	0: "green",
	1: "red",
}

const ENGINE_COLORS = {
	0: "red",
	1: "green",
}

const LIGHTS_COLORS = {
	0: "red",
	1: "green",
	2: "blue",
}

const VEHICLE_LOCK_COLORS = {
	0: "green",
	1: "red",
}

$(".door").click(function() {
    let doorIndex = $(this).data("doorIndex");

    $.post(`https://${resName}/toggleDoor`, JSON.stringify({doorIndex: doorIndex}));
})

$("#vehicle-engine").click(function() {
	$.post(`https://${resName}/toggleEngine`);
});

$("#vehicle-lock").click(function() {
	$.post(`https://${resName}/toggleVehicleLock`);
})

function setColorToElement(element, color) {
	element.find("i").css("color", color);

	return;
}

function updateDoorsClosedStatus(doorsClosedStatus) {	
	for(const[doorIndex, doorStatus] of Object.entries(doorsClosedStatus)) {
		let door = $(`.door[data-door-index="${doorIndex}"]`);

		if(doorStatus < 0) { // If less than 0 it means the door is destroyed or doesn't exist on the vehicle
			door.css("opacity", "15%");

			door.toggleClass("clickable", false);
		} else {
			door.css("opacity", "100%");

			door.toggleClass("clickable", true);
		}

		const color = DOORS_COLORS[doorStatus];

		setColorToElement(door, color);
	}
}

function updateEngineStatus(isEngineStarted) {
	const color = ENGINE_COLORS[isEngineStarted];

	setColorToElement($("#vehicle-engine"), color);
}

function updateVehicleLightsStatus(vehicleLightsStatus) {
	const color = LIGHTS_COLORS[vehicleLightsStatus];

	setColorToElement($("#vehicle-light"), color);
}

function updateVehicleLockStatus(isVehicleLocked) {
	const color = VEHICLE_LOCK_COLORS[isVehicleLocked];

	setColorToElement($("#vehicle-lock"), color);
}

function updateVehicleName(vehicleName) {
	$("#vehicle-name").text(vehicleName);

	var carname = document.getElementById('vehicle-name');
    var carnameLength = carname.innerHTML.length;

	if (carnameLength >= 25) {
        $("#vehiclemenu").css("padding-top", "150px")
	} else if (carnameLength >= 15) {
        $("#vehiclemenu").css("padding-top", "125px")
    } else {
        $("#vehiclemenu").css("padding-top", "100px")
    }
}

function updateSelectedVehiclePlate(event) {
	let plate = $(this).data("plate");
	let netId = $(this).data("netId");
	
	$.post(`https://${resName}/selectVehiclePlate`, JSON.stringify({plate: plate, netId: netId}));
}

function updateOwnedPlates(ownedPlates) {
	let ownedPlatesDiv = $("#owned-plates");
	ownedPlatesDiv.empty();

	if(ownedPlates) {
		for(const[plate, vehiclesNetIDs] of Object.entries(ownedPlates)) {

			for(const[netID, vehicleLabel] of Object.entries(vehiclesNetIDs)) {
				if(!vehicleLabel) continue; // It may happen that if the vehicle net ID is below or 10 or similar, javascript fills the Object as an array

				let plateElement = $(`<li class="list-group-item vehicle-plate text-center fw-bold" data-net-id="${netID}" data-plate="${plate}">${plate.toUpperCase()} - ${vehicleLabel}</li>`);
	
				plateElement.click(updateSelectedVehiclePlate);
	
				ownedPlatesDiv.append(plateElement);
			}
		}
	}
}

// So dropdown won't be closed when clicking on it
$(".allow-focus").click(function(e) {
	e.stopPropagation();
})

$(".setting").change(function() {
	let setting = $(this).data("setting");
	let value = $(this).prop("checked");

	$.post(`https://${resName}/setPlayerSetting`, JSON.stringify({settingName: setting, settingValue: value}));
})

function updatePlayerSettings(settings) {
	for(const[settingName, settingValue] of Object.entries(settings)) {
		let setting = $(`.setting[data-setting="${settingName}"]`);

		setting.prop("checked", settingValue);
	}
}

function updateServerSettings(settings) {
	if(!settings.allowAutoCloseDoorsOnVehicleLock) {
		$(`.setting[data-setting="autoCloseDoorsOnVehicleLock"]`).prop("checked", false).prop("disabled", true);
	}

	
	if(!settings.allowAutoOpenDriverDoorOnUnlock) {
		$(`.setting[data-setting="autoOpenDriverDoorOnUnlock"]`).prop("checked", false).prop("disabled", true);
	}
}

/* ADMIN MENU STUFF */

$("#new-job-vehicle-btn").click(function() {
	let jobVehiclesModal = $("#job-vehicle-modal");

	// Converts from edit modal to create modal
	jobVehiclesModal.data("action", "create");
	
	$("#delete-job-vehicle-btn").hide();
	$("#save-job-vehicle-btn").text( getLocalizedText("menu:create") );
	
	// Sets the vehicle name and DISABLES the edit of the vehicle
	$("#job-vehicle-id").val("").prop("disabled", false);
	$(`input[type=radio][name="job-vehicle-type"]`).prop("disabled", false);
	setAllowedJob({}); // Clears the old allowed jobs

	$("#leave-vehicle-if-not-allowed").prop("checked", false).change();

	jobVehiclesModal.modal("show");
})

async function getJobLabel(jobName) {
	return new Promise((resolve, reject) => {
		$.post(`https://${resName}/getJobLabel`, JSON.stringify({jobName: jobName}), function(jobLabel) {
			resolve(jobLabel);
		})
	})
}

async function setAllowedJob(allowedJobs) {
	let allowedJobsDiv = $("#allowed-jobs");

	allowedJobsDiv.val("");

	allowedJobsDiv.data("allowedJobs", allowedJobs);

	if(allowedJobs === false) {
		allowedJobsDiv.val(getLocalizedText("menu:all_jobs_allowed"));
		return;
	}

	let text = "";

	let isTheFirst = true;

	for(const[jobName, _] of Object.entries(allowedJobs)) {
		if(isTheFirst) {
			text = await getJobLabel(jobName);

			isTheFirst = false;
		} else {
			text += `, ${await getJobLabel(jobName)}`;
		}
	}

	allowedJobsDiv.val(text);
}

/* JOBS VEHICLES */
let jobVehiclesDatatable = $("#job-vehicles-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let id = data[0]

			editJobVehicle(id);
		})
	},
});

let jobVehicles = {};

function loadJobVehicles() {
	$.post(`https://${resName}/getAllJobVehicles`, {}, async function(rawJobVehicles) {
		// Manually create the table to avoid incompatibilities due table indexing

		jobVehicles = {};

		for(const[k, jobVehicleData] of Object.entries(rawJobVehicles)) {
			jobVehicles[jobVehicleData.id] = jobVehicleData;
		}

		jobVehiclesDatatable.clear();

		for(const[id, jobVehicleData] of Object.entries(jobVehicles)) {
			let jobNames = "";
			let isTheFirstName = true;

			if(jobVehicleData.allowedJobs) {
				for(const[jobName, _] of Object.entries(jobVehicleData.allowedJobs)) {
					if(isTheFirstName) {
						jobNames = await getJobLabel(jobName);;
						isTheFirstName = false;
					} else {
						jobNames += `, ${ await getJobLabel(jobName) }`;
					}
				}
			}

			// If isTheFirstName is still to true, it means that there is no job allowed
			if(isTheFirstName) {
				jobNames = "None";
			}

			jobVehiclesDatatable.row.add([
				id,
				jobNames,
				jobVehicleData.type == "plate" ? getLocalizedText("menu:plate") : getLocalizedText("menu:vehicle_model"),
			]);
		}

		jobVehiclesDatatable.draw();
	})
}

$("#job-vehicle-choose-jobs-btn").click(async function() {
	let currentAllowedJobs = $("#allowed-jobs").data("allowedJobs");

	let allowedJobs = await jobsDialog(currentAllowedJobs);

	setAllowedJob(allowedJobs);
});
	
function editJobVehicle(id) {
	let jobVehiclesModal = $("#job-vehicle-modal");

	let jobVehicleData = jobVehicles[id];

	// Converts from create modal to edit modal
	jobVehiclesModal.data("action", "edit");
	jobVehiclesModal.data("id", id);

	$("#delete-job-vehicle-btn").show();
	$("#save-job-vehicle-btn").text( getLocalizedText("menu:save") );

	// Sets the vehicle name and DISABLES the edit of the id
	$("#job-vehicle-id").val(jobVehicleData.id).prop("disabled", true);
	$(`input[type=radio][name="job-vehicle-type"]`).prop("disabled", true);

	setAllowedJob(jobVehicleData.allowedJobs);
	switchJobVehicleType(jobVehicleData.type);

	if(jobVehicleData.kickIfNotAllowed >= 1) {
		$("#leave-vehicle-if-not-allowed").prop("checked", true).change();

		if(jobVehicleData.kickIfNotAllowed == 2) {
			$("#leave-vehicle-if-not-allowed-only-driver").prop("checked", true);
		}
	} else {
		$("#leave-vehicle-if-not-allowed").prop("checked", false).change()
	}

	jobVehiclesModal.modal("show");
}

$("#delete-job-vehicle-btn").click(function() {
	let jobVehiclesModal = $("#job-vehicle-modal");
	let id = jobVehiclesModal.data("id");

	$.post(`https://${resName}/deleteJobVehicle`, JSON.stringify({id: id}), function(isSuccessful) {
		if(isSuccessful) {
			loadJobVehicles();

			jobVehiclesModal.modal("hide");
		}
	});
})

$("#leave-vehicle-if-not-allowed").change(function() {
	let enabled = $(this).prop("checked");

	$("#leave-vehicle-if-not-allowed-only-driver").prop("disabled", !enabled)

	if(!enabled) {
		$("#leave-vehicle-if-not-allowed-only-driver").prop("checked", false);
	}
})

$("#job-vehicle-form").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let jobVehiclesModal = $("#job-vehicle-modal");
	let action = jobVehiclesModal.data("action");

	// 0 = disabled, 1 = all seats, 2 = only driver
	let kickIfNotAllowedStatus = $("#leave-vehicle-if-not-allowed").prop("checked") ? ( $("#leave-vehicle-if-not-allowed-only-driver").prop("checked") ? 2 : 1 ) : 0

	let jobVehicleData = {
		id: $("#job-vehicle-id").val(),
		allowedJobs: $("#allowed-jobs").data("allowedJobs"),
		kickIfNotAllowed: kickIfNotAllowedStatus,
		type: $("input[name='job-vehicle-type']:checked").val(),
	}

	switch(action) {
		case "create": {
			$.post(`https://${resName}/createJobVehicle`, JSON.stringify(jobVehicleData), function(isSuccessful) {
				if(isSuccessful) {
					loadJobVehicles();
					jobVehiclesModal.modal("hide");
				}
			});

			break;
		}

		case "edit": {
			$.post(`https://${resName}/updateJobVehicle`, JSON.stringify(jobVehicleData), function(isSuccessful) {
				if(isSuccessful) {
					loadJobVehicles();
					jobVehiclesModal.modal("hide");
				}
			});

			break;
		}
	}
})

function switchJobVehicleType(type) {	
	$(`input[type=radio][name="job-vehicle-type"][value="${type}"]`).prop("checked", true);

	switch(type) {
		case "plate": {
			$("#job-vehicle-id-label").text( getLocalizedText("menu:plate") );

			break;
		}

		case "vehicle": {
			$("#job-vehicle-id-label").text( getLocalizedText("menu:vehicle_model") );

			break;
		}
	}
}

// On radio button change named "job-vehicle-type"
$("input[name='job-vehicle-type']").change(function() {
	let type = $(this).val();

	switchJobVehicleType(type);
});

// Open/Close menu
function openMenu(version, fullConfig) {
	$("#vehicles-keys-version").text(version);

	loadJobVehicles();
	loadSettings(fullConfig);

    $("#vehicles-keys").show()
}

function closeMenu() {
	// Resets current active tab
	$("#vehicles-keys").find(".nav-link, .tab-pane").each(function() {
		if($(this).data("isDefault") == "1") {
			$(this).addClass(["active", "show"])
		} else {
			$(this).removeClass(["active", "show"])
		}
	})
	
    $("#vehicles-keys").hide();

    $.post(`https://${resName}/close`, {})
}
$("#close-main-btn").click(closeMenu);

// Messages received by client
window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

	switch(action) {
		case "updateDoorsClosedStatus": {
			updateDoorsClosedStatus(data.doorsClosedStatus);

			break;
		}

		case "updateVehicleEngineStatus": {
			updateEngineStatus(data.vehicleEngineStatus);
			
			break;
		}

		case "updateVehicleLightsStatus": {
			updateVehicleLightsStatus(data.vehicleLightsStatus);

			break;
		}

		case "updateVehicleLockStatus": {
			updateVehicleLockStatus(data.vehicleLockStatus);

			break;
		}

		case "updateVehicleName": {
			updateVehicleName(data.vehicleName);

			break;
		}

		case "updateOwnedPlates": {
			updateOwnedPlates(data.ownedPlates);

			break;
		}

		case "updatePlayerSettings": {
			updatePlayerSettings(data.settings);

			break;
		}

		case "updateServerSettings": {
			updateServerSettings(data.settings);
			
			break;
		}

		case "openMenu": {
			openMenu(data.version, data.fullConfig);

			break;
		}

		case "vehicleTransfer": {
			$("#vehicle-transfer-plate").val(data.plate);
			$("#vehicle-transfer-vehicle").val(data.vehicleLabel);
			$("#vehicle-transfer-price").val(0);
			$("#vehicle-transfer-modal").modal("show");
			break;
		}

		case "vehicleTransferAskConfirm": {
			$("#vehicle-transfer-ask-confirm-plate").val(data.plate);
			$("#vehicle-transfer-ask-confirm-vehicle").val(data.vehicleLabel);
			$("#vehicle-transfer-ask-confirm-price").val(data.price);
			$("#vehicle-transfer-ask-confirm-modal").modal("show");
			break;
		}
	}
});

/* SETTINGS */
function setVehicleAlarmsItems(vehicleAlarmsItems) {
	for(const[alarmType, itemName] of Object.entries(vehicleAlarmsItems)) {
		$("#settings_vehicleAlarmsItems").find(`[data-alarm-type="${alarmType}"]`).val(itemName);
	}
}

function getVehicleAlarmsItems() {
	let alarms = {};

	$("#settings_vehicleAlarmsItems").find(`input`).each(function() {
		alarms[$(this).data("alarmType")] = $(this).val();
	})
	
	return alarms;
}

function setAlarmRadarBlip(blip) {
	$("#alarm-radar-blip-sprite").val(blip.sprite);
	$("#alarm-radar-blip-color").val(blip.color);
	$("#alarm-radar-blip-scale").val(blip.scale);
	$("#alarm-radar-blip-interval").val(blip.interval);
	$("#alarm-radar-blip-duration").val(blip.duration);
}

function getAlarmRadarBlip() {
	return {
		sprite: parseInt( $("#alarm-radar-blip-sprite").val() ),
		color: parseInt( $("#alarm-radar-blip-color").val() ),
		scale: parseFloat( $("#alarm-radar-blip-scale").val() ),
		interval: parseInt( $("#alarm-radar-blip-interval").val() ),
		duration: parseInt( $("#alarm-radar-blip-duration").val() )
	}
}

function setVehicleLockAnim(anim) {
	$("#vehiclelock-anim-dict").val(anim.dict);
	$("#vehiclelock-anim-name").val(anim.name);
	$("#vehiclelock-anim-duration").val(anim.duration);
}

function getVehicleLockAnim() {
	return {
		dict: $("#vehiclelock-anim-dict").val(),
		name: $("#vehiclelock-anim-name").val(),
		duration: parseInt( $("#vehiclelock-anim-duration").val() )
	}
}

function setAlarmBlip(blip) {
	$("#alarm-blip-sprite").val(blip.sprite);
	$("#alarm-blip-color").val(blip.color);
	$("#alarm-blip-scale").val(blip.scale);
	$("#alarm-blip-duration").val(blip.duration);
}

function getAlarmBlip() {
	return {
		sprite: parseInt( $("#alarm-blip-sprite").val() ),
		color: parseInt( $("#alarm-blip-color").val() ),
		scale: parseFloat( $("#alarm-blip-scale").val() ),
		duration: parseInt( $("#alarm-blip-duration").val() )
	}
}

$("#settings-choose-jobs-for-alarms-btn").click(async function() {
	const oldJobs = $(this).data("allowedJobs");
	const newJobs = await jobsDialog(oldJobs);

	$(this).data("allowedJobs", newJobs);
});

function loadSettings(fullConfig) {
	// Generic
	setTomSelectValue("#settings_locale", fullConfig.locale);

	$("#settings_acePermission").val(fullConfig.acePermission);
	$("#can-move-visual-with-keys-menu-opened").prop("checked", fullConfig.canMoveVisualWithKeysMenuOpened);

	// NPCs vehicles
	$("#lock-driving-vehicles-npc").prop("checked", fullConfig.lockDrivingVehiclesNPC);
	$("#probability-police-alert-npc-stolen-vehicles").val(fullConfig.probabilityPoliceAlertNpcStolenVehicles);

	$("#can-target-driving-npcs").prop("checked", fullConfig.canTargetDrivingNPCs);
	$("#can-search-for-keys").prop("checked", fullConfig.canSearchForKeys);
	$("#probability-to-find-keys").val(fullConfig.chancesToFindKeys);
	$("#seconds-to-search-for-keys").val(fullConfig.secondsToSearchForKeys);

	// Vehicle contract item name
	$("#vehicle-transfer-contract-item-name").val(fullConfig.vehicleTransferContractItemName);

	// Alarms
	setVehicleAlarmsItems(fullConfig.vehicleAlarmsItems);
	setAlarmRadarBlip(fullConfig.alarmRadarBlip);
	setVehicleLockAnim(fullConfig.vehicleLockAnim);
	$("#settings-choose-jobs-for-alarms-btn").data("allowedJobs", fullConfig.jobsThatCanInstallAlarms);


	$("#default-vehiclelock-key").val(fullConfig.defaultVehiclelockKey);

	$("#allow-auto-close-doors-on-vehicle-lock").prop("checked", fullConfig.allowAutoCloseDoorsOnVehicleLock);
	$("#allow-auto-open-driver-door-on-unlock").prop("checked", fullConfig.allowAutoOpenDriverDoorOnUnlock);

	$("#time-to-hotwire").val(fullConfig.timeToHotwire);
	$("#hotwire-anim-dict").val(fullConfig.hotwireAnimDict);
	$("#hotwire-anim-name").val(fullConfig.hotwireAnimName);
	$("#hotwire-probability-of-success").val(fullConfig.hotwireProbabilityOfSuccess);

	setTomSelectValue("#settings_menuPosition", fullConfig.menuPosition);

	$("#alarm-seconds-duration").val(fullConfig.alarmSecondsDuration);
	
	setAlarmBlip(fullConfig.alarmBlip);

	$("#seconds-to-install-alarm").val(fullConfig.secondsToInstallAlarm);

	$("#allow-breaking-windows-of-players-owned-vehicles").prop("checked", fullConfig.allowBreakingWindowsOfPlayersOwnedVehicles);
	$("#completely-disable-window-destroy-feature").prop("checked", fullConfig.completelyDisableWindowDestroy);

	$("#is-hotwire-required").prop("checked", fullConfig.isHotwireRequired);
	
	$("#default-vehiclekeys-menu-key").val(fullConfig.defaultVehiclekeysMenuKey);

	$("#use-3d-text").prop("checked", fullConfig.use3Dtext);

	$("#can-players-share-keys").prop("checked", fullConfig.canPlayersShareKeys);

	$("#auto-start-engine-if-the-vehicle-is-owned").prop("checked", fullConfig.autoStartEngineIfTheVehicleIsOwned);

	// Lockpick
	$("#lockpick-item-name").val(fullConfig.lockpick.itemName)
	$("#lockpick-lose-on-use").prop("checked", fullConfig.lockpick.loseOnUse)
	$("#time-to-lockpick").val(fullConfig.lockpick.timeToLockpick)

	// Toggle engine
	$("#default-toggle-engine-key").val(fullConfig.defaultToggleEngineKey);
	$("#enable-toggle-engine-key").prop("checked", fullConfig.enableKeyToToggleEngine);
}

$("#settings").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let clientSettings = {
		vehicleLockAnim: getVehicleLockAnim(),
		defaultVehiclelockKey: $("#default-vehiclelock-key").val(),
		allowAutoCloseDoorsOnVehicleLock: $("#allow-auto-close-doors-on-vehicle-lock").prop("checked"),
		allowAutoOpenDriverDoorOnUnlock: $("#allow-auto-open-driver-door-on-unlock").prop("checked"),
		timeToHotwire: parseInt( $("#time-to-hotwire").val() ),
		hotwireAnimDict: $("#hotwire-anim-dict").val(),
		hotwireAnimName: $("#hotwire-anim-name").val(),
		hotwireProbabilityOfSuccess: parseInt( $("#hotwire-probability-of-success").val() ),
		menuPosition: $("#settings_menuPosition").val(),
		alarmSecondsDuration: parseInt( $("#alarm-seconds-duration").val() ),
		alarmBlip: getAlarmBlip(),
		secondsToInstallAlarm: parseInt( $("#seconds-to-install-alarm").val() ),
		allowBreakingWindowsOfPlayersOwnedVehicles: $("#allow-breaking-windows-of-players-owned-vehicles").prop("checked"),
		isHotwireRequired: $("#is-hotwire-required").prop("checked"),
		defaultVehiclekeysMenuKey: $("#default-vehiclekeys-menu-key").val(),
		use3Dtext: $("#use-3d-text").prop("checked"),
		canPlayersShareKeys: $("#can-players-share-keys").prop("checked"),
		autoStartEngineIfTheVehicleIsOwned: $("#auto-start-engine-if-the-vehicle-is-owned").prop("checked"),
		defaultToggleEngineKey: $("#default-toggle-engine-key").val(),
		lockDrivingVehiclesNPC: $("#lock-driving-vehicles-npc").prop("checked"),
		completelyDisableWindowDestroy: $("#completely-disable-window-destroy-feature").prop("checked"),

		// NPC vehicles
		canTargetDrivingNPCs: $("#can-target-driving-npcs").prop("checked"),
		canSearchForKeys: $("#can-search-for-keys").prop("checked"),
		chancesToFindKeys: parseInt( $("#probability-to-find-keys").val() ),
		secondsToSearchForKeys: parseInt( $("#seconds-to-search-for-keys").val() ),

		enableKeyToToggleEngine: $("#enable-toggle-engine-key").prop("checked"),

		canMoveVisualWithKeysMenuOpened: $("#can-move-visual-with-keys-menu-opened").prop("checked")
	}

	let sharedSettings = {
		locale: $("#settings_locale").val(),
		alarmRadarBlip: getAlarmRadarBlip(),
		lockpick: {
			itemName: $("#lockpick-item-name").val(),
			loseOnUse: $("#lockpick-lose-on-use").prop("checked"),
			timeToLockpick: parseInt( $("#time-to-lockpick").val() )
		}
	}

	let serverSettings = {
		acePermission: $("#settings_acePermission").val(),
		vehicleAlarmsItems: getVehicleAlarmsItems(),
		probabilityPoliceAlertNpcStolenVehicles: parseInt( $("#probability-police-alert-npc-stolen-vehicles").val() ),
		vehicleTransferContractItemName: $("#vehicle-transfer-contract-item-name").val(),
		jobsThatCanInstallAlarms: $("#settings-choose-jobs-for-alarms-btn").data("allowedJobs"),
	}

	const response = await $.post(`https://${resName}/saveSettings`, JSON.stringify({
		clientSettings: clientSettings,
		serverSettings: serverSettings,
		sharedSettings: sharedSettings,
	}));
	showServerResponse(response);

	refreshTranslations(sharedSettings.locale);
});

$("#vehicle-transfer-choose-target-btn").click(function() {
	const transferModal = $("#vehicle-transfer-modal");

	transferModal.modal("hide");

	$.post(`https://${resName}/chooseTarget`, JSON.stringify({}), function(targetServerId) {
		$("#vehicle-transfer-target").val(targetServerId);

		transferModal.modal("show");
	});
})

$("#vehicle-transfer-cancel").click(function() {
	$.post(`https://${resName}/cancelVehicleTransfer`, {});
})

$("#vehicle-transfer-form").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	const targetServerId = parseInt( $("#vehicle-transfer-target").val() );
	const plate = $("#vehicle-transfer-plate").val();
	const vehicleLabel = $("#vehicle-transfer-vehicle").val();
	const price = parseInt( $("#vehicle-transfer-price").val() );

	$.post(`https://${resName}/transferVehicle`, JSON.stringify({
		targetServerId: targetServerId,
		plate: plate,
		vehicleLabel: vehicleLabel,
		price: price,
	}));

	$("#vehicle-transfer-modal").modal("hide");
});

$("#vehicle-transfer-ask-confirm-form").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	$.post(`https://${resName}/confirmTransfer`);

	$("#vehicle-transfer-ask-confirm-modal").modal("hide");
})

$("#vehicle-transfer-ask-confirm-cancel").click(function() {
	$.post(`https://${resName}/cancelTransfer`);
})