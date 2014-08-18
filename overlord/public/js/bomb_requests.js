function turn_on() {
    if ($('#status').val() == '') {
        $.ajax({
            type: "POST",
            url: "/on",
            success: function() {
                get_status()
            }
        })
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
            clear_display()
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
            clear_display()
        }
    })
}

function set_timer() {
    $.ajax({
        type: "POST",
        url: "/set/timer",
        data: $('#bomb_form').serialize(),
        success: function() {
            get_status()
            clear_display()
        }
    })
}

function start_timer() {
    if ($('#status').val() == 'ACTIVE') {
        $.ajax({
            type: "POST",
            url: "/start/timer",
            success: function() {
                $('#action').val('COUNTDOWN')
                timer_countdown()
            }
        })
    }
}

function get_timer() {
    $.ajax({
        type: "GET",
        url: "/timer",
        dataType: 'text',
        success: function(data) {
            $('#display').val(to_time_string(data))
        }
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
