

$(document).on("keydown", function() {
    if (event.repeat) {
        return;
    }
    switch (event.keyCode) {
        case 27: // ESC
            console.log('close')
            ClosePage();
            break
    }
});

window.onload = function(e) {
    window.addEventListener("message", function(event) {
        switch (event.data.action) {
            case "open":
                OpenPage(event.data.pages);
                break;
        }
    });
};
function OpenPage(data) {
    console.log(JSON.stringify(data));
    const imgContainer = document.querySelector('.imgBody');
    const imgElement = document.createElement('img');
    imgContainer.innerHTML = '';
    let currentIndex = 0;

    function showNextImage() {
        if (currentIndex < data.length) {
            imgElement.src = data[currentIndex];
            currentIndex++;
        } else {
            currentIndex = 0;
        }
        // Remove existing plus icons
        removePlusIcons();
        // Add plus icons
        addPlusIcons();
    }

    function navigate(event) {
        const rect = imgElement.getBoundingClientRect();
        const x = event.clientX - rect.left; // Calculate the click position relative to the image

        if (x < rect.width / 2) {
            // Click on the left side of the image
            currentIndex = (currentIndex - 1 + data.length) % data.length;
        } else {
            // Click on the right side of the image
            currentIndex = (currentIndex + 1) % data.length;
        }

        imgElement.src = data[currentIndex];
        // Remove existing plus icons
        removePlusIcons();
        // Add plus icons
        addPlusIcons();
    }

    function addPlusIcons() {
        const plusIconLeft = document.createElement('div');
        plusIconLeft.className = 'plus-icon left-icon';
        plusIconLeft.innerHTML = '&#45;';
        imgContainer.appendChild(plusIconLeft);

        const plusIconRight = document.createElement('div');
        plusIconRight.className = 'plus-icon right-icon';
        plusIconRight.innerHTML = '&#43;';
        imgContainer.appendChild(plusIconRight);
    }

    function removePlusIcons() {
        const existingIcons = document.querySelectorAll('.plus-icon');
        existingIcons.forEach(icon => imgContainer.removeChild(icon));
    }

    showNextImage();
    imgContainer.addEventListener('click', navigate);
    imgContainer.appendChild(imgElement);

    $(".imgBody").fadeIn(300);
}



function ClosePage() {
    $.post("https://k_display/Close", JSON.stringify({}));
    $(".imgBody").fadeOut(300);
}
