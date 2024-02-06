var Lang = null;
var Nails = [];


$(document).ready(function () {
    $('#nails-1').on('input', function () {
        var val = $('#nails-1').val();

        $('#nails-1').val(val);
        $('#label-nails-1').text(Lang['LASHES'] + ' ' + val + Lang['DIVISER'] + $('#nails-1').attr('max'));
        change(1, val)
    });

    $('#nails-1-desc').on('click', function (e) {
        var val = parseInt($('#nails-1').val()) - 1;

        if (val >= $('#nails-1').attr('min')) {
            $('#nails-1').val(val);
            $('#label-nails-1').text(Lang['LASHES'] + ' ' + val + Lang['DIVISER'] + $('#nails-1').attr('max'));
            change(1, val)
        }
    })

    $('#nails-1-asc').on('click', function (e) {
        var val = parseInt($('#nails-1').val()) + 1;

        if (val <= $('#nails-1').attr('max')) {
            $('#nails-1').val(val);
            $('#label-nails-1').text(Lang['LASHES'] + ' ' + val + Lang['DIVISER'] + $('#nails-1').attr('max'));
            change(1, val)
        }
    })

    $('#nails-2').on('input', function () {
        var val = $('#nails-2').val();

        $('#nails-2').val(val);
        $('#label-nails-2').text(Lang['LASHES_COLOR'] + ' ' + val + Lang['DIVISER'] + $('#nails-2').attr('max'));
        change(2, val)
    });

    $('#nails-2-desc').on('click', function (e) {
        var val = parseInt($('#nails-2').val()) - 1;

        if (val >= $('#nails-2').attr('min')) {
            $('#nails-2').val(val);
            $('#label-nails-2').text(Lang['LASHES_COLOR'] + ' ' + val + Lang['DIVISER'] + $('#nails-2').attr('max'));
            change(2, val)
        }
    })

    $('#nails-2-asc').on('click', function (e) {
        var val = parseInt($('#nails-2').val()) + 1;

        if (val <= $('#nails-2').attr('max')) {
            $('#nails-2').val(val);
            $('#label-nails-2').text(Lang['LASHES_COLOR'] + ' ' + val + Lang['DIVISER'] + $('#nails-2').attr('max'));
            change(2, val)
        }
    })

    $('#cancel').on('click', function (e) {
        $("body").css("display", "none");
        $.post('https://fs_lashessaloon/fs_lashessaloon:reset', JSON.stringify({}));
    })

    $('#confirm').on('click', function (e) {
        $("body").css("display", "none");
        let nail1 = parseInt($('#nails-1').val())
        let nail2 = parseInt($('#nails-2').val())
        $.post('https://fs_lashessaloon/fs_lashessaloon:save', JSON.stringify({ id: Nails[nail1 - 1].number, texture: nail2 - 1 }));
    })
});

window.addEventListener("message", function (event) {
    let data = event.data;
     
    switch (data.action) {
        case 'open':

            if (data.lash.number != -1) {
                $('#nails-1').val(data.lash.number);
                $('#nails-2').val(data.lash.colour);
                $("#label-nails-1").text(Lang['LASHES'] + ' ' + data.lash.number + Lang['DIVISER'] + $('#nails-1').attr('max'));
                $("#label-nails-2").text(Lang['LASHES_COLOR'] + ' ' + data.lash.colour + Lang['DIVISER'] + $('#nails-2').attr('max'));
            } else {
                $.post('https://fs_lashessaloon/fs_lashessaloon:change', JSON.stringify({ type: 1, number: Nails[0].number }));
                $.post('https://fs_lashessaloon/fs_lashessaloon:change', JSON.stringify({ type: 2, number: 0 }));
                $('#nails-1').val(1);
                $('#nails-2').val(1);
                $("#label-nails-1").text(Lang['LASHES'] + ' ' + $('#nails-1').attr('min') + Lang['DIVISER'] + $('#nails-1').attr('max'));
                $("#label-nails-2").text(Lang['LASHES_COLOR'] + ' ' + $('#nails-2').attr('min') + Lang['DIVISER'] + $('#nails-2').attr('max'));
            }


            $("body").css("display", "block");
            break;
        case 'lang':
        
            Lang = data.lang;
            Nails = data.lash;
            $('#nails-1').attr('max', Nails.length)
            $('#nails-2').attr('max', Nails[0].max)
            $("#label-nails-1").text(Lang['LASHES'] + ' ' + $('#nails-1').attr('min') + Lang['DIVISER'] + $('#nails-1').attr('max'));
            $("#label-nails-2").text(Lang['LASHES_COLOR'] + ' ' + $('#nails-2').attr('min') + Lang['DIVISER'] + $('#nails-2').attr('max'));
            $("#confirm").text(Lang['BUTTON_SUCCESS']);
            $.post('https://fs_lashessaloon/fs_lashessaloon:datarecive', JSON.stringify({}));
            break;
        case 'close':

            $("body").css("display", "none");
            $.post('https://fs_lashessaloon/close', JSON.stringify({}));
            break;
    }
});

function change(type, number) {
    
    if (type == 1) {
        $('#nails-2').val(0)
        $('#nails-2').attr('max', Nails[number - 1].max)
        $('#label-nails-2').text(Lang['LASHES_COLOR'] + ' 1' + Lang['DIVISER'] + $('#nails-2').attr('max'));
        $.post('https://fs_lashessaloon/fs_lashessaloon:change', JSON.stringify({ type: type, number: Nails[number - 1].number }));
        $.post('https://fs_lashessaloon/fs_lashessaloon:change', JSON.stringify({ type: 2, number: 0 }));
    } else {
        $.post('https://fs_lashessaloon/fs_lashessaloon:change', JSON.stringify({ type: type, number: number - 1 }));
    }
}