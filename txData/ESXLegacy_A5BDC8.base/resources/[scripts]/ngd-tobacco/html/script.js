window.addEventListener('message', function(event) {
    switch (event.data.action) {
        case 'showCameraControls':
            document.getElementById('camera-controls').style.display = 'block';
            document.getElementById('exit-instruction').style.display = 'block'; 
            document.getElementById('discreet-text').style.display = 'block'; 
            document.getElementById('camera-name').style.background = 'rgba(0, 0, 0, 0.5)';
            break;
        case 'hideCameraControls':
            document.getElementById('camera-controls').style.display = 'none';
            document.getElementById('exit-instruction').style.display = 'none';
            document.getElementById('camera-name').innerText = '';
            document.getElementById('discreet-text').style.display = 'none';
            document.getElementById('camera-name').style.background = 'transparent';
            break;
        case 'setCameraName':
            document.getElementById('camera-name').innerText = event.data.name;
            document.getElementById('discreet-text').style.display = 'block'; 
            document.getElementById('camera-name').style.background = 'rgba(0, 0, 0, 0.5)';
            break;
        case 'clearCameraName':
            document.getElementById('camera-name').innerText = '';
            document.getElementById('camera-name').style.background = 'transparent';
            document.getElementById('discreet-text').style.display = 'none'; 
            break;
    }
});
