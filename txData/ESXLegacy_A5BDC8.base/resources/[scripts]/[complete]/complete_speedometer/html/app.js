var max_speed;
var max_gear;

window.addEventListener('message', function (event) {
    var data = event.data;
    
    if (data.type == 'speedometer') {
        if (data.open == true) {
            document.getElementById('speedometer_content').hidden = false
            document.getElementById('speedometer_position').classList.add(data.position)
        } else {
            document.getElementById('speedometer_content').hidden = true
        }
    } else if (data.type == 'refresh_ui') {
        RefreshUi(data.speed, data.gear, data.fuel)
    } else if (data.type == 'refresh_max') {
        if (data.km == true) {
            document.getElementById('ui_speed_km').innerHTML = 'km/h'
        } else {
            document.getElementById('ui_speed_km').innerHTML = 'miles/h'
        }
        max_speed = data.max_speed
        max_gear = data.max_gear
        document.getElementById('ui_gear_text').innerHTML = max_gear

    }
});

function RefreshUi(speed, gear, fuel) {
    if (speed == 0 || gear == 0) {
        if (speed == 0) {
            document.getElementById('ui_speed_stroke').setAttribute('stroke-width', '0')
        }
        if (gear == 0) {
            document.getElementById('ui_gear_stroke').setAttribute('stroke-width', '0')
        }
    } else {
        document.getElementById('ui_speed_stroke').setAttribute('stroke-width', '9')
        document.getElementById('ui_gear_stroke').setAttribute('stroke-width', '6')
    }
    var speed_perc = (speed / max_speed) * 100
    var speed_stroke, speed_stroke_dasharray
    if (speed_perc >= 100) {
        speed_stroke = 325
    } else {
        speed_stroke = (325 * speed_perc) / 100
    }
    speed_stroke_dasharray = speed_stroke.toString() + " 1000"
    document.getElementById('ui_speed_stroke').setAttribute('stroke-dasharray', speed_stroke_dasharray)
    document.getElementById('ui_speed_text').innerHTML = speed

    var fuel_stroke, fuel_stroke_dasharray
    fuel_stroke = (80 * fuel) / 100
    fuel_stroke_dasharray = fuel_stroke.toString() + " 1000"
    document.getElementById('ui_fuel_stroke').setAttribute('stroke-dasharray', fuel_stroke_dasharray)

    var gear_perc = (gear / max_gear) * 100
    var gear_stroke, gear_stroke_dasharray
    gear_stroke = (80 * gear_perc) / 100
    //console.log(gear_perc);
    gear_stroke_dasharray = gear_stroke.toString() + " 1000"
    document.getElementById('ui_gear_stroke').setAttribute('stroke-dasharray', gear_stroke_dasharray)
}