function input_from_keypad(value) {

    maxlength = $('#display').attr('maxLength')

    if ($('#status').val() != '' && $('#display').val().length < maxlength) {
        $('#display').val( $('#display').val() + value.toString() )
    }
}

function submit_bomb() {

    set = $('#set').val()
    action_type = $('#action').val()

    switch(action_type) {
    case 'TIMER':
        if (set == 'true') {
            set_timer()
        }
        else{
            start_timer()
        }
        break

    case 'ACTIVATE':
        if (set == 'true') {
            set_activation_code()
        }
        else{
            activate()
        }
        break

    case 'DEACTIVATE':
        if (set == 'true') {
            set_deactivation_code()
        }
        else{
            deactivate()
        }
        break
    }

    reset_hidden_fields()
}

function clear_display() {
    $('#display').val('')
}

function reset_hidden_fields() {
    $('#set').val('false')
    $('#action').val('none')
}

function turn_on() {
    $.ajax({
        type: "POST",
        url: "/on",
        success: function() {
            get_status()
        }
    })
}

function set_modifier() {
    $('#set').val('true')
}

function set_action(action_type) {
    $('#action').val(action_type)

    // Format display according to action type
    if (action_type == 'TIMER') {
        format_display('TIME')
    }
    else {
        format_display('CODE')
    }
}

function format_display(display_type) {

    if (display_type == "TIME") {
        $('#display').val('0:00:00')
        $('#display').attr('maxLength',7)
    }

    if (display_type == "CODE") {
        $('#display').val('')
        $('#display').attr('maxLength',4)
    }
}

function set_activation_code() {
    $.ajax({
        type: "POST",
        data: $('#bomb_form').serialize(),
        url: "/set/activation_code"
    })
}

function set_deactivation_code() {
    $.ajax({
        type: "POST",
        data: $('#bomb_form').serialize(),
        url: "/set/deactivation_code"
    })
}

function activate() {
    $.ajax({
        type: "POST",
        url: "/activate",
        data: $('#bomb_form').serialize(),
        success: function() {
            get_status()
        }
    })
}

function deactivate() {
    $.ajax({
        type: "POST",
        url: "/deactivate",
        data: $('#bomb_form').serialize(),
        success: function() {
            get_status()
        }
    })
}

function set_timer() {
    $.ajax({
        type: "POST",
        url: "/set/timer"
    })
}

function start_timer() {
    $.ajax({
        type: "POST",
        url: "/start/timer"
    })
}

function get_status() {
    $.ajax({
        type: "GET",
        url: "/status",
        dataType: 'text',
        success: function(data) {
            $('#status').val(data)
        }
    })
}
