let type = '';

$(document).ready(function() {
    window.addEventListener('message', (event) => {
        if (event.data && event.data.type) {
            switch (event.data.type) {
                case 'mirandaShow':
                    $('.miranda-container').animate({bottom: '1vw'}, 750);
                    break;
                case 'mirandaHide':
                    $('.miranda-container').animate({bottom: '-20vw'}, 750);
                    break;
            }
        }
    });
});

function doTest(type) {
    let e = new CustomEvent('message');
    e.data = {
        type: type
    }
    window.dispatchEvent(e);
}