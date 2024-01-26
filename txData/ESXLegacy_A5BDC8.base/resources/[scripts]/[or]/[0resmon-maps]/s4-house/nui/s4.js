var cur_id = null;
var houseDataId = null;
var fpanel = false;
var ppl_all = [];
var ppl_h = [];
var localidf = null;
var HouseItems = null;
var lock = false;

var isGarageCoordSetted = false;
var isHouseCoordSetted = false;
var createHouseIMG = null;
var selectedHouse = "apartment3";
var selectedTheme = "modern";

var jobGrades = [];

$(window).ready(function() {
    window.addEventListener('message', (event) => {
        //$("body").show("fade");
        //$('.boss-wrapper').fadeIn(500);
        let data = event.data;     
        $(".cardBoxBG").css("display", "none");
        $(".createHouseMenuBG").css("display", "none");
        $(".boss-wrapper").css("display", "none");
        $(".manage").css("display", "none");
        $(".props_menuResul").hide("fade");
        $(".resul_category").hide("fade");
        $(".map").css("opacity", "1.00");
        switch (data.action) {
            case "init":
                __init__(data);
                break;
            case "update":
                __init__(data);
                break;
            case "manage":
                __manage__(data);
                $(".prop_yon").hide("fade");
                break;
            case "notif":
                __notif__(data);
                break;
            case "setCalisanNew":
                $('#YeniCalisanlar').fadeIn(300);
                let cemal = '';
                $('#YeniCalisanlar').html("")
                for (let index = 0; index < data.data.length; index++) {
                    const element = data.data[index];
                    cemal = `
                    <div id="secildi" data-source="${element.id}" class="Calman">
                        <h1>${element.name} (ID: ${element.id})</h1>
                    </div>
                    `
                    $('#YeniCalisanlar').append(cemal);
                    
                }
                break;
            case "localidf":
                localidf = data.id;
                HouseItems = data.HouseItems;
                $("#alarm_price").html(`${data.alarm}$`);
                break;
            case "decor":
                $("body").show("fade");
                $(".prop_yon").show("fade");
                break;
            case "createHouse":
                $(".bg").css("display", "block");
                $(".createHouseMenuBG").css("display", "block");
                $("body").css("display", "block");
                $(".buttons").css("display", "block");
                $('.boss-wrapper').fadeOut(500);
                
                break;
            case "EmlakYonetimPanel":
                $('.bg').hide()
                $("body").show("fade");
                $('#YeniCalisanlar').hide();
                $('.boss-wrapper').fadeIn(500);
                $('#KasaPara').html(data.Money);

                const employeesList = document.querySelector("#myEmployers");
                const hireemplooo = document.querySelector(".employeeList");
                jobGrades = data.Grades;

                $('#myEmployers').html(`
                <div class="employeeBox">
                   <button id="newCalisan" class="benburdayim">Hire Someone New</button>
                </div>`);

                if (data.EmployeesMenu.length > 0) {
                    // employeesList.innerHTML = "";
                    $.each(data.EmployeesMenu, function(index, value) {
                        if(value.gradelevel !== data.level){
                            e = `
                                <div class="employeeBox" data-pid="${value.Player.identifier}" data-currentGrade="${value.Player.job.grade}">
                                    <p class="employeeName">${value.Name}</p>
                                    <p class="employeeJob">${value.txt}</p>
                                    <div class="gradientLight"></div>
                                    <img src="./images/pp.svg" class="playerPhoto">
                                    <div class="employeeButtons">
                                        <div id="kovMal" data-source="${value.Player.source}" class="plusButton"><i class="fa-solid fa-ban"></i></div>
                                    </div>
                                </div>
                            `;
                        } else {
                            e = `
                            <div class="employeeBox" data-pid="${value.Player.identifier}" data-currentGrade="${value.Player.job.grade}">
                                <p class="employeeName">${value.Name}</p>
                                <p class="employeeJob">${value.txt}</p>
                                <div class="gradientLight"></div>
                                <img src="./images/pp.svg" class="playerPhoto">
                                <div class="employeeButtons">
                                    <div class="minusButton"><i class="fa-solid fa-ban"></i></div>
                                </div>
                            </div>
                        `;
                        }

                        $("#myEmployers").append(e);
                    });
                }

                if (data.HireMenu.length > 0) {
                    hireemplooo.innerHTML = "";
                    $.each(data.HireMenu, function(index, value) {
                        e = `
                            <div class="employeeBox" data-pid="${value.Player.sourceplayer}">
                                <p class="employeeName">${value.Name}</p>
                                <p class="employeeJob"></p>
                                <div class="gradientLight"></div>
                                <img src="./images/pp.svg" class="playerPhoto">
                                <div class="employeeButtons">
                                    <div class="fireButton">Hire</div>
                                </div>
                            </div>
                        `;

                        $("#employeeList").append(e);
                    });
                }
                break;
        }
    });
});

$(document).on('click', '#kovMal', function(){
    $.post('http://s4-house/Kov', JSON.stringify({
        id: $(this).attr("data-source")
    }));
    _c_();
});

$(document).on('click', '#secildi', function(){
    $.post('http://s4-house/IseAlMali', JSON.stringify({
        id: $(this).attr("data-source")
    }))
    _c_();
});

$(document).on('click', '#newCalisan', function(){
    $('.bossMoneyManagementMenu').fadeOut(300);
    $.post('http://s4-house/newCalisanlar', JSON.stringify({}))
});

$(document).ready(function() {

    $(document).on('click', 'a', function() { __click_($(this)); });

    $(document).on('click', 'w', function() { __click_($(this)); });

    $(document).on('click', '.ele', function() { __click_($(this)); });

    $(document).on('click', '.selector', function() { __click_($(this)); });

    $(document).on('click', '.fireButton', function() {
        const dataPlayer = $(this).closest(".employeeBox").data("pid");
        $.post("https://s4-house/RecruitPerson", JSON.stringify({ Id: Number(dataPlayer) }), function(x) {});

        $("body").hide("fade");
    });

    $(document).on('click', '.plusButton', function() {  
        const dataPlayer = $(this).closest(".employeeBox")[0].dataset.pid;
        const curGrade = $(this).closest(".employeeBox")[0].dataset.currentgrade;
        if (Number(curGrade) + 1 <= Object.keys(jobGrades).length) {
            $.post("https://s4-house/UpdateJob", JSON.stringify({ cid: dataPlayer, grade: Number(curGrade) + 1 }), function(x) {});
            $("body").hide("fade");
        }
        
    });

    $(document).on('click', '.minusButton', function() {
        const dataPlayer = $(this).closest(".employeeBox")[0].dataset.pid;
        const curGrade = $(this).closest(".employeeBox")[0].dataset.currentgrade;
        if (Number(curGrade) - 1 < 0) {
            $.post("https://s4-house/FireEmployee", JSON.stringify({ cid: dataPlayer, grade: Number(curGrade) - 1 }), function(x) {});
            $("body").hide("fade");
        } 
    });

    $("#close_createHouse").click(function() {
        $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
        $("body").hide("fade");

    });

    $('.houseimg').click(function(e) {
        e.preventDefault();
        $('.pet-input-area-header').text(Locales.petChangePhoto)
        showMenus("interactionPanel", "pet-input-area")
    });

    document.getElementById("_createHouseIMG").addEventListener("keyup", function(event) {
        var urlPattern = new RegExp('^(https?:\\/\\/)?' + // validate protocol
            '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|' + // validate domain name
            '((\\d{1,3}\\.){3}\\d{1,3}))' + // validate OR ip (v4) address
            '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*' + // validate port and path
            '(\\?[;&a-z\\d%_.~+=-]*)?' + // validate query string
            '(\\#[-a-z\\d_]*)?$', 'i'); // validate fragment locator

        if (!!urlPattern.test(event.target.value)) {
            document.getElementById("houseImgCreateHouse").src = event.target.value;
            createHouseIMG = event.target.value;
        }
    });

    const houseTypes = document.querySelectorAll('.houseType');
    const apartmentColors = [
        { value: 'modern', text: '#FFFFFF' },
        { value: 'moody', text: '#FF0000' },
        { value: 'vibrant', text: '#444444' },
        { value: 'sharp', text: '#2B1700' },
        { value: 'monochrome', text: '#800080' },
        { value: 'seductive', text: '#FFFF00' },
        { value: 'regal', text: '#808080' },
        { value: 'aqua', text: '#000000' }
    ];

    const houseColors = [
        { value: 'kirmizi', text: '#ff0000' },
        { value: 'mavi', text: '#0000ff' },
        { value: 'mor', text: '#800080' },
        { value: 'turuncu', text: '#ffa500' }
    ]

    houseTypes.forEach(houseType => {
        houseType.addEventListener('focus', function(event) {
            selectedHouse = event.target.id;
            const list = document.getElementById('createHouseColors');
            list.innerHTML = "";
            document.getElementById("houseImgCreateHouse").src = `properties/${selectedHouse}.png`;
            if (selectedHouse == "apartment3") {
                apartmentColors.forEach(element => {
                    const newLi = document.createElement('li');
                    newLi.id = element.value;
                    newLi.tabIndex = "-1";
                    newLi.style.backgroundColor = element.text;
                    newLi.addEventListener('focus', function(event) {
                        selectedTheme = event.target.id;
                    });
                    list.appendChild(newLi);
                });
            } else {
                houseColors.forEach(element => {
                    const newLi = document.createElement('li');
                    newLi.id = element.value;
                    newLi.tabIndex = "-1";
                    newLi.style.backgroundColor = element.text;
                    newLi.addEventListener('focus', function(event) {
                        selectedTheme = event.target.id;
                    });
                    list.appendChild(newLi);
                });
            }
        });
    });
});

__notif__ = (x) => {

    $("body").show("fade");
    $(".buy").hide("fade");
    $(".bg").hide("fade");
    $(".notif").show("fade");
    $(".notif").html("");

    house = x.house;
    cur_id = house.id;

    switch (x.type) {
        case "gin":
            $(".notif").html(`
        <a href="#" data-s4="nbtn" data-type="gin_g"> Go Inside</a>
        <a href="#" data-s4="close_">Cancel</a>
        <div class="door_handle">
            <img src="./door_handle.png" />
        </div>
        `);
            break;
        case "ginv":
            $(".notif").html(`
        <a href="#" data-s4="nbtn" data-type="gin_g"> Go Inside</a>
        <a href="#" data-s4="nbtn" data-type="ginv">ENTER BY Vehicle</a>
        <a href="#" data-s4="close_">Cancel</a>
        <div class="door_handle">
            <img src="./door_handle.png" />
        </div>
        `);
            break;
        case "gout":
            $(".notif").html(`
        <a href="#" data-s4="nbtn" data-type="gout" >Go Outside</a>
        <a href="#" data-s4="close_">Cancel</a>
        <div class="door_handle">
            <img src="./door_handle.png" />
        </div>
        `);
            break;
    }

}


__init__ = (x) => {

    house = x.house;
    $("body").show("fade");
    $(".bg").show("fade");
    $(".cardBoxBG").show("fade");

    var marker = L.marker(gtaToLatLng(house.coords.house_in.x, house.coords.house_in.y));
    marker.addTo(map);

    setTimeout(function(){ 
        map.invalidateSize()
        map.setView(gtaToLatLng(house.coords.house_in.x, house.coords.house_in.y), 4);
    }, 1000);

    $(".sellHouseSection").css("display", "block;");
    $("#h_friends").css("display", "block");
    $(".buttons").css("display", "block");
    $("#h_no").html(house.dataid);

    cur_id = house.id;
    houseDataId = house.dataid;
    if (house.img !== undefined && house.img !== null && house.img !== "") {
        document.getElementById("houseImg").src = house.img;
    } else {
        document.getElementById("houseImg").src = `./properties/${house.info.ApartmentNamee}.png`;
    }
    if (house.alarm) {
        document.getElementById("alarmImageRes").src = "./images/AlarmEnabled.png";
    } else {
        document.getElementById("alarmImageRes").src = "./images/AlarmDisabled.png";
    }
    
    $("#h_gstock").html(house.garage_stock);

    //$(".stars").html("");

    $("#h_who").html(house.who);
    $("#house_ownerName").html(house.who + "'S HOUSE");

    //for (let i = 0; i < house.stars; i++) {
    //    $(".stars").append(`<i class="fas fa-star star"></i>`);
    //}
//
    //for (let i = 0; i < 5 - house.stars; i++) {
    //    $(".stars").append(`<i class="fas fa-star nostar"></i>`);
    //}

    if (house.pool_or_garden == true) {
        $("#h_gp").html("Is available");
    } else {
        $("#h_gp").html("Not available");
    }

    $("#h_price").html("$" + house.numco);

    if (house.owner != house.curidf) {
        $(".sellHouseSection").css("display", "none");
        $("#h_friends").css("display", "none");
        $(".buttons").css("display", "none");
    } else {
        $(".buyHouseBtn").css("display", "none");
        $("#h_friends").css("display", "inline-block");
        $(".sellHouseSection").css("display", "block");
    }

    if (house.owner == "") {
        $(".buyHouseBtn").css("display", "block");
        $(".sellHouseSection").css("display", "none");
        $("#h_friends").css("display", "none");
        $(".buttons").css("display", "none");
    }
    if (house.infoauth == "friend") {
        $("#h_friends").css("display", "block");
        $(".buttons").css("display", "block");
        $(".buyHouseBtn").css("display", "none");
        $(".sellHouseSection").css("display", "block");
        $(".sellHouseBtn").css("display", "none");
    }

    $("#h_sell_price").html(house.perc.toLocaleString() + "$");

    $("#u_bank").html(`<i class="fa-solid fa-credit-card"></i> ` + x.user.bank.toLocaleString() + "$");
    $("#u_cash").html(`<i class="fa-solid fa-wallet"></i> ` + x.user.cash.toLocaleString() + "$");


    $(".cars").html("");
    for (let i = 0; i < house.garage_stock; i++) {

        if (house.garage[i]) {
            e = `
        <div class="car">
        <center>
         <img src="https://raw.githubusercontent.com/MericcaN41/gta5carimages/main/images/${house.garage[i].model.toLowerCase()}.png" />
        </center>
          <div class="alt">
            <h2>${house.garage[i].model}</h2>
            <i class="fa-solid fa-car"></i>
          </div>
        </div>
        `;
        } else {
            e = `
        <div class="car">
          <i class="fa-duotone fa-empty-set center"></i>
        </div>
        `;
        }
        $(".cars").append(e);

    }

}

var up = false;

function stopMoving() {
    up = false;
}

async function move(yon) {
    up = true;
    while (up) {
        $.post('https://s4-house/yon', JSON.stringify({ yon: yon, multiplier: $("#multiplier").val() }));
        if (yon == "ok") {
            up = false;
            $(".prop_yon").hide("fade");
        }
        await sleep(5);
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}


__click_ = async(x) => {
    switch (x.data("s4")) {
        case "close-modal":
            $(".modal").hide("fade");
            setTimeout(() => { $(".modal").css("display", "none") }, 500);
            $(".sellmodal").hide("fade");
            setTimeout(() => { $(".sellmodal").css("display", "none"); $(".map").css("opacity", "1.00"); }, 500);
            break;
        case "buy-house":
            await __loading__();
            $(".modal").show("fade");
            setTimeout(() => { $(".modal").css("display", "block") }, 500);
            break;
        case "with-bank":
            await __loading__();
            $(".modal").hide("fade");
            setTimeout(() => { $(".modal").css("display", "none") }, 500);
            $.post("https://s4-house/tryBuy", JSON.stringify({ id: cur_id, type: "bank", dataid: houseDataId }), function(x) {});
            break;
        case "with-cash":
            await __loading__();
            $(".modal").hide("fade");
            setTimeout(() => { $(".modal").css("display", "none") }, 500);
            $.post("https://s4-house/tryBuy", JSON.stringify({ id: cur_id, type: "cash", dataid: houseDataId }), function(x) {});
            break;
        case "sell-house":
            await __loading__();
            $(".sellmodal").show("fade");
            setTimeout(() => { $(".sellmodal").css("display", "block") }, 500);
            break;
        case "sell-with-cash":
            await __loading__();
            $(".sellmodal").hide("fade");
            setTimeout(() => { $(".sellmodal").css("display", "none") }, 500);
            $.post("https://s4-house/trySell", JSON.stringify({ id: cur_id, type: "cash" }), function(x) {

            });
            break;
        case "sell-with-bank":
            await __loading__();
            $(".sellmodal").hide("fade");
            setTimeout(() => { $(".sellmodal").css("display", "none") }, 500);
            $.post("https://s4-house/trySell", JSON.stringify({ id: cur_id, type: "bank" }), function(x) {

            });
            break;
        case "garage":
            await __loading__();
            $(".garagemodal").show("fade");
            setTimeout(() => { $(".garagemodal").css("display", "block") }, 500);
            break;
        case "close-gm":
            $(".map").css("display", "block");
            $(".garagemodal").hide("fade");
            setTimeout(() => { $(".garagemodal").css("display", "none"); $(".map").css("opacity", "1.00"); }, 500); 
            break;
        case "home":
            await __loading__();
            $("body").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            $.post("https://s4-house/close", JSON.stringify({ id: cur_id }), function(x) {});
            break;
        case "theme":
            $.post("https://s4-house/changeTheme", JSON.stringify({ id: cur_id, theme: $(x).data("theme") }), function(x) {});
            await __loading__();
            $("body").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
            break;
        case "garaj":
            $.post("https://s4-house/changeGarage", JSON.stringify({ id: cur_id, garaj: Number($(x).data("garaj")) }), function(x) {});
            await __loading__();
            $("body").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
            break;
        case "propset":
            $.post("https://s4-house/changeProp", JSON.stringify({ id: cur_id, prop: $(x).data("prop") }), function(x) {});
            await __loading__();
            $("body").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
            break;
        case "table":
            tid = $(x).data("theme");
            await __loading__();
            $("body").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            $.post("https://s4-house/table", JSON.stringify({ tid: tid, turl: $("#u_" + tid).val() }), function(x) {});
            $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
            break;
        case "close_":
            $("body").hide("fade");
            $(".manage").hide("fade");
            $(".notif").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
            break;
        case "walls_":
            _c_m_();
            await __wait__(500);
            $(".walls").show("fade");
            break;
        case "tables_":
            _c_m_();
            await __wait__(500);
            $(".tables").show("fade");
            break;
        case "esyaal_":
            _c_m_();
            await __wait__(500);
            $(".resul_category").show("fade");
            $(".props_menuResul").show("fade");
            $(".manage").hide("fade");
            $(".walls").show("fade");
            //$(".esyaal").show("fade");
            break;
        case "house_":
            _c_m_();
            await __wait__(500);
            $(".house").show("fade");
            break;
        case "garajbak_":
            _c_m_();
            await __wait__(500);
            $(".garaj").show("fade");
            break;
        case "name_":
            $(".hname").toggle("fade");
            break;
        case "hname":
            $(".hname").hide("fade");
            $.post("https://s4-house/SetName", JSON.stringify({ id: cur_id, name: $("#_hname").val() }), function(x) {});
            _c_();
            break;
        case "friends":
            $(".cardBoxBG").css("display", "none");
            await __loading__();
            fpanel = true;
            $(".friends").show("fade");

            $.post("https://s4-house/GetPlayers", JSON.stringify({ id: cur_id }), function(data) {

                ppl_all = data.all;
                ppl_h = data.house;

                $("#all").html("");
                $("#friends").html("");

                $.each(ppl_all, function(i, v) {
                    if (localidf != v.id)
                        $("#all").append(`<a class="pl" data-s4="add-house-f" data-id="${v.id}" data-name="${v.name}" >${v.name} <i class="fa-thin fa-plus"></i></a>`);
                });

                $.each(ppl_h, function(i, v) {
                    if (localidf != v.id)
                        $("#friends").append(`<a class="pl" data-s4="remove-house-f" data-id="${v.id}" data-name="${v.name}" >${v.name} <i class="fa-thin fa-minus"></i></a>`);
                });


            });

            break;
        case "add-house-f":
            xid = $(x).data("id");
            xname = $(x).data("name");
            $.post("https://s4-house/AddFriends", JSON.stringify({ id: cur_id, pid: xid, name: xname }), function(data) {});
            $("#friends").append(`<a class="pl" data-s4="remove-house-f" data-id="${xid}" data-name="${xname}"  >${xname} <i class="fa-thin fa-minus"></i></a>`);
            x.remove();
            break;
        case "remove-house-f":
            xid = $(x).data("id");
            xname = $(x).data("name");
            $.post("https://s4-house/RemoveFriends", JSON.stringify({ id: cur_id, pid: xid, name: xname }), function(data) {});
            $("#all").append(`<a class="pl" data-s4="add-house-f" data-id="${xid}" data-name="${xname}"  >${xname} <i class="fa-thin fa-plus"></i></a>`);
            x.remove();
            break;
        case "close-and-save":
            _c_m_();
            await __wait__(500);
            $(".friends").hide("fade");
            $.post("https://s4-house/StreamFriends", JSON.stringify({ id: cur_id }), function(data) {});
            break;
        case "showcat_":
            $("#propsMenu_items").html("");
            $(".scrl3").html("");
            $.each(HouseItems.items, function(i, v) {
                if ($(x).data("cat") == v.category || $(x).data("cat") == "all") {
                    $(".scrl3").append(`
                    <div class="wall" style="background: url(./items/${v.prop}.png) #ffffff26;background-size: cover;">
                        <i class="fa-solid fa-box-open" data-s4="showprop_" data-prop="${v.prop}"></i>
                        <h2>${v.label}</h2>
                        <a data-s4="buyprop_" data-prop="${v.prop}" href="#">${v.price}$</a>
                    </div>`);
                    $("#propsMenu_items").append(`
                    <div class="wall" style="background: url(./items/${v.prop}.png) #ffffff26;background-size: cover;">
                        <i class="fa-solid fa-box-open" data-s4="showprop_" data-prop="${v.prop}"></i>
                        <h2>${v.label}</h2>
                        <a data-s4="buyprop_" data-prop="${v.prop}" href="#">${v.price}$</a>
                    </div>`);
                }
            });
            break;
        case "showprop_":
            $.post("https://s4-house/showProp", JSON.stringify({ prop: $(x).data("prop") }));
            $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
            $("body").hide("fade");
            $(".manage").hide("fade");
            $(".notif").hide("fade");
            $(".bg").hide("fade");
            $(".manage").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            break;
        case "buyprop_":
            $.post("https://s4-house/buyProp", JSON.stringify({ prop: $(x).data("prop") }));
            $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
            $("body").hide("fade");
            $(".manage").hide("fade");
            $(".notif").hide("fade");
            $(".manage").hide("fade");
            $(".bg").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            break;
        case "replace_":
            $.post("https://s4-house/replaceProp", JSON.stringify({ prop: $(x).data("prop") }));
            $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
            $("body").hide("fade");
            $(".manage").hide("fade");
            $(".notif").hide("fade");
            $(".manage").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            break;
        case "locchange_":
            $.post("https://s4-house/changeLocProp", JSON.stringify({ prop: $(x).data("prop") }));
            $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
            $("body").hide("fade");
            $(".manage").hide("fade");
            $(".notif").hide("fade");
            $(".bg").hide("fade");
            $(".manage").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            break;
        case "sellprop_":
            $.post("https://s4-house/sellPropLan", JSON.stringify({ prop: $(x).data("prop") }));
            $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
            $("body").hide("fade");
            $(".manage").hide("fade");
            $(".notif").hide("fade");
            $(".bg").hide("fade");
            $(".manage").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            break;
        case "marker_":
            $.post("https://s4-house/marker", JSON.stringify({}));
            $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
            $("body").hide("fade");
            $(".manage").hide("fade");
            $(".notif").hide("fade");
            $(".bg").hide("fade");
            $(".manage").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            break;
        case "lock_":
            $.post("https://s4-house/lock", JSON.stringify({}));
            break;
        case "alarm_":
            _c_m_();
            await __wait__(500);
            $(".alarm").show("fade");
            break;
        case "qr_":
            _c_m_();
            await __wait__(500);
            $(".qr").show("fade");
            break;
        case "buy_alarm_":
            _c_();
            $.post("https://s4-house/buyAlarm", JSON.stringify({}));
            break;
        case "remove_alarm_":
            _c_();
            $.post("https://s4-house/removeAlarm", JSON.stringify({}));
            break;
        case "nbtn":

            if ($(x).data("type") == "ginv") {

                $(".notif").hide("fade");
                $(".garagemodal").hide("fade");

                if ($(x).data("slot")) {
                    $("body").hide("fade");
                    $(".manage").hide("fade");
                    $(".manage").hide("fade");
                    setTimeout(() => { $("body").css("display", "none") }, 500);
                    $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
                    $.post("https://s4-house/GoInGarage", JSON.stringify({ id: cur_id, slot: $(x).data("slot") }), function(x) {});
                    return;
                }

                await __loading__();
                $(".garagemodal").show("fade");
                setTimeout(() => { $(".garagemodal").css("display", "block") }, 500);



                $.post("https://s4-house/GetGarageAvailables", JSON.stringify({ id: cur_id }), function(x) {

                    $(".cars").html("");
                    // .reverse()
                    $.each(x, function(i, v) {
                        // console.log(i, v, v.car.length);
                        if (v.car.length === undefined) {
                            e = `
                            <div class="car">
                            <center>
                             <img src="https://raw.githubusercontent.com/MericcaN41/gta5carimages/main/images/${v.car.model.toLowerCase()}.png" />
                            </center>
                              <div class="alt">
                                <h2>${v.car.model}</h2>
                              </div>
                            </div>
                            `;
                        } else {
                            e = `
                            <div class="car">
                              <i class="fa-duotone fa-empty-set center" style="top: 40%;"></i>
                              <div class="alt">
                                     <h2>${i+1}</h2>
                                     <i class="fa-solid fa-car selector" data-s4="nbtn" data-type="ginv" data-slot="${i+1}"></i>
                              </div>
                            </div>
                            `;
                        }
                        $(".cars").append(e);

                        // console.log(i,v);
                        // if(v.status == false) {
                        //      $(".notif").append(`<a href="#" class="gs" data-s4="nbtn" data-type="ginv" data-slot="${v.slot}" >${v.slot}</a>`);
                        // }else {
                        //      $(".notif").append(`<a href="#" class="gs" ><i class="fas fa-car"></i></a>`);  
                        // }
                    });

                    // $(".notif").html(``);

                    // $.each(x.reverse(), function (i, v) { 
                    //     if(v.status == false) {
                    //     $(".notif").append(`<a href="#" class="gs" data-s4="nbtn" data-type="ginv" data-slot="${v.slot}" >${v.slot}</a>`);
                    //     }else {
                    //     $(".notif").append(`<a href="#" class="gs" ><i class="fas fa-car"></i></a>`);  
                    //     }
                    // });

                    // $(".notif").append(`<a href="#" class="gs" data-s4="close_"><i class="fas fa-do-not-enter"></i></a>`);


                    // <a href="#" data-s4="nbtn" class="gs" data-type="gin_g">1</a>
                });
            } else {
                _c_();
                $.post("https://s4-house/tp", JSON.stringify({ id: cur_id, type: $(x).data("type") }), function(x) {});
            }
            break;
        case "sethousecoord":
            await __loading__();
            $("body").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            isHouseCoordSetted = true;
            $.post("https://s4-house/setHouseCoord", JSON.stringify({}), function(x) {});
            break;
        case "setgaragecoord":
            await __loading__();
            $("body").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            isGarageCoordSetted = true;
            $.post("https://s4-house/setGarageCoord", JSON.stringify({}), function(x) {});
            break;
        case "createhouse":
            var price = $("#_createHousePrice").val()
            var houseNameee = $("#_createHouseName").val()
            if (isGarageCoordSetted && isHouseCoordSetted && price.length > 0) {
                await __loading__();
                isGarageCoordSetted = false;
                isHouseCoordSetted = false;
                $("body").hide("fade");
                setTimeout(() => { $("body").css("display", "none") }, 500);
                $.post("https://s4-house/createHouse", JSON.stringify({ houseType: selectedHouse, price: price, houseImg: createHouseIMG, name: houseNameee, theme: selectedTheme }), function(x) {});
                $(".createHouseMenuBG").css("display", "none");
            }
            break;
        case "takehouseimg":
            $.post("https://s4-house/takeImg", JSON.stringify({}), function(x) {
                document.getElementById("houseImgCreateHouse").src = x;
                createHouseIMG = x;
                $("#_createHouseIMG").val(x);
                $(".bg").css("display", "block");
                $(".createHouseMenuBG").css("display", "block");
                $("body").css("display", "block");
                $(".buttons").css("display", "block");
            });
            $("body").hide("fade");
            setTimeout(() => { $("body").css("display", "none") }, 500);
            $(".createHouseMenuBG").css("display", "none");
            break;
    }

}

_c_m_ = () => {
    $(".qr").hide("fade");
    $(".tables").hide("fade");
    $(".walls").hide("fade");
    $(".garaj").hide("fade");
    $(".esyaal").hide("fade");
    $(".props_menuResul").hide("fade");
    $(".house").hide("fade");
    $(".resul_category").hide("fade");
    $(".alarm").hide("fade");
}
_c_ = () => {
    $("body").hide("fade");
    $(".manage").hide("fade");
    $(".buy").hide("fade");
    $(".bg").hide("fade");
    $(".notif").hide("fade");
    $(".manage").hide("fade");
    $(".garagemodal").hide("fade");
    $(".sellmodal").hide("fade");
    $(".friends").hide("fade");

    if (fpanel == true) {
        $.post("https://s4-house/StreamFriends", JSON.stringify({ id: cur_id }), function(data) {});
        fpanel = false;
    }

    setTimeout(() => { $("body").css("display", "none") }, 500);
    $.post("https://s4-house/close", JSON.stringify({}), function(x) {});
}

__loading__ = async() => {
    return new Promise((res) => {
        $(".loading").show("fade");
        setTimeout(() => { $(".loading").css("display", "block") }, 150);
        $(".map").css("opacity", "0.10");
        setTimeout(() => {
            $(".loading").hide("fade");
            setTimeout(() => {
                $(".loading").css("display", "none");
                res("done");
            }, 150);
        }, 1000);
    });
}

__wait__ = async(x) => { return new Promise((res) => { setTimeout(() => { res("done"); }, x); }); }

__manage__ = (x) => {

    house = x.house;
    cur_id = house.id;

    $("body").show("fade");
    $(".buy").hide("fade");
    $(".manage").show("fade");

    $(".scrl").html("");
    $(".scrl7").html("");

    if (house.info.UsingTheme == true) {
        $.each(house.info.Theme, function(i, v) {
            $(".scrl").append(`<div class="wall" style="background: url(./interiors/${i}.png);background-size: cover;"><a data-s4="theme" data-theme="${i}" href="#">Select</a></div>`);
        });
    } else {
        $(".scrl").append(`<div class="wall" style="background: url(./interiors/esyasiz.png);background-size: cover;"><a data-s4="propset" data-prop="esyasiz" href="#">Select</a></div>`);
        $(".scrl").append(`<div class="wall" style="background: url(./interiors/esyali.png);background-size: cover;"><a data-s4="propset" data-prop="esyali" href="#">Select</a></div>`);

        $.each(house.info.props, function(i, v) {
            if (v != "esyali" && v != "esyasiz") {
                $(".scrl").append(`<div class="wall" style="background: url(./interiors/${v}.png);background-size: cover;"><a data-s4="theme" data-theme="${v}" href="#">Select</a></div>`);

            }
        });
    }

    $.each(house.info.GarageTheme, function(i, v) {
        $(".scrl7").append(`<div class="wall" style="background: url(./garages/${v}.png);background-size: cover;"><a data-s4="garaj" data-garaj="${v}" href="#">Select</a></div>`);
    });


    $(".scrl3").html("");
    $(".scrl4").html("");
    $(".category").html(`
        <div class="ele" data-s4="showcat_" data-cat="all">
        <i class="fa-solid fa-dolly"></i>
        </div>
    `);

    $(".resul_category").html(`
        <div class="ele" data-s4="showcat_" data-cat="all">
        <i class="fa-solid fa-dolly"></i>
        </div>
    `);

    $.each(HouseItems.category, function(i, v) {
        $(".category").append(`
            <div class="ele" data-s4="showcat_" data-cat="${i}">
                <i class="${v.icon}"></i>
            </div>
        `);
    });

    $.each(HouseItems.category, function(i, v) {
        $(".resul_category").append(`
            <div class="ele" data-s4="showcat_" data-cat="${i}">
                <i class="${v.icon}"></i>
            </div>
        `);
    });
    $("#propsMenu_items").html("");
    $.each(HouseItems.items, function(i, v) {
        $("#propsMenu_items").append(`
        <div class="wall" style="background: url(./items/${v.prop}.png) #ffffff26;background-size: cover;">
            <i class="fa-solid fa-box-open" data-s4="showprop_" data-prop="${v.prop}"></i>
            <h2>${v.label}</h2>
            <a data-s4="buyprop_" data-prop="${v.prop}" href="#">${v.price}$</a>
        </div>`);
    });

    $.each(HouseItems.items, function(i, v) {
        $(".scrl3").append(`
        <div class="wall" style="background: url(./items/${v.prop}.png) #ffffff26;background-size: cover;">
            <i class="fa-solid fa-box-open" data-s4="showprop_" data-prop="${v.prop}"></i>
            <h2>${v.label}</h2>
            <a data-s4="buyprop_" data-prop="${v.prop}" href="#">${v.price}$</a>
        </div>`);
    });

    if (x.house_obj) {


        $.each(x.house_obj, function(i, v) {
            $(".scrl4").append(`
            <div class="wall" style="background: url(./items/${v.prop}.png) #ffffff26;background-size: cover;">
                <h2>${v.label}</h2>
                <a data-s4="replace_" data-prop="${v.id}" href="#">Replace</a>
                <a data-s4="locchange_" style="bottom: 18%;" data-prop="${v.id}" href="#">Change location</a>
                <a data-s4="sellprop_" style="bottom: 36.5%;" data-prop="${v.pid}" href="#">Sell</a>
            </div>`);
        });
    }


    if (house.alarm == true) {
        $("#active_alarm").hide("fade");
        $("#deactive_alarm").show("fade");
    } else {
        $("#active_alarm").show("fade");
        $("#deactive_alarm").hide("fade");
    }

    $("#qrcode").html(``);

    var url = "https://0resmon.tebex.io/";

    if (x.server.active == true) {
        url = `http://${x.server.ip}:${x.server.port}/house/?id=${cur_id}&identifier=${house.owner}`;
    }

    new QRCode(document.getElementById('qrcode'), {
        text: url,
        width: 256,
        height: 256,
        colorDark: '#000',
        colorLight: '#fff',
        correctLevel: QRCode.CorrectLevel.H
    });

}

$(document).on('keydown', function() {
    switch (event.keyCode) {
        case 27:
            _c_();
            break;
    }
});


print = (x) => { console.log(x); }

$(document).on('click', '#ParaYatir', function(e) {
    e.preventDefault();
    $.post('https://s4-house/ParaYatir', JSON.stringify({
        KacPara: $("#YatirilanMiktar").val()
    }));
    _c_();
})

$(document).on('click', '#ParaCek', function(e) {
    e.preventDefault();
    $.post('https://s4-house/ParaCek', JSON.stringify({
        KacPara: $("#CekilenMiktar").val()
    }));
    _c_();
})

$(document).on('click', '#bossClose', function() {
    _c_();
})

$(document).on('click', '#bossStashManagement', function(e) {
    e.preventDefault();
    $.post('https://s4-house/Stashh', JSON.stringify({}));
    _c_();
})

$(document).on('click', '#bossMoneyManagement', function() {
    $(".employeeWrapper").hide();
    $(".bossMoneyManagementMenu").fadeIn(500);
})

$(document).on('click', '#bossEmployeManagement', function() {
    $(".bossMoneyManagementMenu").hide();
    $(".employeeWrapper").fadeIn(500);
})

const scrollContainer = document.querySelector(".employeeList");
const scrollContainer1 = document.querySelector("#employeeList");

scrollContainer.addEventListener("wheel", (evt) => {
    evt.preventDefault();
    scrollContainer.scrollLeft += evt.deltaY;
});

scrollContainer1.addEventListener("wheel", (evt) => {
    evt.preventDefault();
    scrollContainer1.scrollLeft += evt.deltaY;
});

var mapMinZoom = 2;
var mapMaxZoom = 7;
var mapMaxResolution = 0.25;
var mapMinResolution = Math.pow(2, mapMaxZoom) * mapMaxResolution;
var mapCenterLat = -5525;
var mapCenterLng = 3755;
var gtaOffset = 0.66;
var debug = false;
var overlay = false;
var bottomLeft = [-8192, 0];
var topRight = [0, 8192];
var bounds = [bottomLeft, topRight];

var crs = L.CRS.Simple;

crs.scale = function (zoom) {
    return Math.pow(2, zoom) / mapMinResolution;
};

var layer = L.tileLayer("https://skyrossm.github.io/PolyZoneCreator/tiles/{z}/{x}/{y}.png", {
    minZoom: mapMinZoom,
    maxZoom: mapMaxZoom,
    noWrap: true,
    tms: true,
});

var map = new L.Map("map1", {
    maxZoom: mapMaxZoom,
    minZoom: mapMinZoom,
    layers: [layer],
    crs: crs,
    center: [mapCenterLat, mapCenterLng],
    zoom: 1,
    zoomControl: false,
});

function latlngToGTA(latlng) {
    var x = (latlng.lng - mapCenterLng) / gtaOffset;
    var y = (latlng.lat - mapCenterLat) / gtaOffset;
    return [x.toFixed(2), y.toFixed(2)];
}

function gtaToLatLng(x, y) {
    var lng = x * gtaOffset + mapCenterLng;
    var lat = y * gtaOffset + mapCenterLat;
    return L.latLng(lat, lng);
}

map.on("load",function() { setTimeout(() => {
   map.invalidateSize();
}, 1); });
     
map.setView([-6156, 3748], 1);