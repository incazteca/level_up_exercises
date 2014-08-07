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

function set_modifier() {
    $('#set').val('true')
}

function set_action(action_type) {
    $('#action').val(action_type)

    // Format display according to action type
    if (action_type == 'TIMER') {
        if ( $('#set').val() == true ) {
            format_display('TIME')
        }
        else {
            get_timer()
        }
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

function to_time_string(time_in_seconds) {
    divisor = 60

    seconds = time_in_seconds % divisor
    minutes = Math.floor(time_in_seconds / divisor)
    hours   = Math.floor(minutes / divisor)
    minutes = minutes % divisor

    return hours + ":" + pad_number(minutes) + ":" + pad_number(seconds)
}

function timer_countdown() {
    interval = setInterval(function(){
        display = $('#display').val();

        if (display == "0:00:00") {
            clearInterval(interval)
            get_status()
        }

        time = display.split(':')

        if (time[2] == "00") {
            if (time[1] == "00") {
                if (time[0] != "0"){
                    time[0] = (time[0] - 1).toString()
                    time[1] = "59"
                }
            }
            else {
                time[1] = (time[1] - 1).toString()
                time[2] = "59"
            }
        }
        else {
            time[2] = (time[2] - 1).toString()
        }

        display = time[0] + ":" + pad_number(time[1]) + ":" + pad_number(time[2])
        $('#display').val(display)
    }, 1000)
}

function pad_number(number) {
    if (number.toString().length == 1) {
        number = "0" + number
    }

    return number
}
