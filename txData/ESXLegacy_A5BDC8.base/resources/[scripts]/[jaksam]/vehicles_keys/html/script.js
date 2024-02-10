$("#ui").hide();
$(".settingsmenu").hide()
$(".exiticon").hide()

window.addEventListener('message', function(event) {
    var item = event.data;
    if (item.action === "openKeys") {
        $("#ui").fadeIn();
    }
})

// Keys
document.onkeyup = function (e) {
    if (e.key == "Escape") {

        if( $("#ui").is(":visible") ) {
			exit();
		}
    }
};

// Buttons
$(".settings").click(function () {
    $(".settings").hide()
    $(".exiticon").fadeIn()
    $(".settingsmenu").fadeIn()
})

$(".exiticon").click(function () {
    $(".settingsmenu").hide()
    $(".exiticon").hide()
    $(".settings").fadeIn()
})

function exit() {
    $("#ui").fadeOut();
    $.post(`https://${resName}/exit`);
}

// Closes menu when clicking ESC
$(document).on('keyup', function(e) {
	if (e.key == "Escape") {
		if( $("#ui").is(":visible") ) {
			exit();
		}
	}
});