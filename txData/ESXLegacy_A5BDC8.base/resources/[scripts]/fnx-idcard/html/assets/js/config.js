

var bg1 = "./assets/image/img1.png";
var bg2 = "./assets/image/img2.png";
var bg3 = "./assets/image/img3.png";


var genderMale = "M"; // in your db you will have "M" or "m" put here the right configuration 
var genderFemale = "F"; // in your db you will have "F" or "f" put here the right configuration 

var dateSeparator = "-"; // in your db you will have "-" or "/" put here the right configuration 

var dateFormat = 'yyyy/mm/gg'; // in your db you will have 1) mm/gg/yyyy OR 2) gg/mm/yyyy OR 3) yyyy/mm/gg put here the right configuration 

var config= {
    logo:"./assets/image/logo.png", // to change this logo in the varius documents https://prnt.sc/mkBmA73vZ4HS
    qr:"https://media.discordapp.net/attachments/752677237118992394/1111223506856853586/image.png", // to change the qr code at the back of every card, you can create your qr code with the discord invite for example here: https://www.the-qrcode-generator.com/
    bg_front_idCard: bg1,
    bg_back_idCard: bg2,
    bg_front_drive: bg3,
    bg_back_drive: bg2,
    bg_front_weapon: bg2,
    bg_back_weapon: bg3,
    id_card:"ID CARD",
    drive_title:"DRIVE LICENSE",
    weapon:"WEAPON LICENSE",
    height:"HEIGHT",
    dob:"D.O.B",
    sex:"SEX",
    codeHint:"Personal Code",
    drive:"CAR",
    drive_bike:"BIKE",
    drive_truck:"TRUCK",
    yes_license:"🟢",
    no_license:"🔴",
    release_hint:"Relese Date",
}

/* DON'T TOUCH */
function errorLog(string) {
    return console.error(string);   
}