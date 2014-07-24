function input_from_keypad(value) {

    if ($('#status').val() != '') {
        $('#display').val( $('#display').val() + value.toString() )
    }
}

function clear_display() {
    $('#display').val('')
}

function turn_on() {
    $.ajax({
        type: "POST",
        url: "http://localhost:4567/on",
        success: function() {
            //$('#status').val(get_status())
            get_status()
        }
    })
}

function set_activation_code() {
    $.ajax({
        type: "POST",
        url: "http://localhost:4567/set/activation_code"
    })
}

function set_deactivation_code() {
    $.ajax({
        type: "POST",
        url: "http://localhost:4567/set/deactivation_code"
    })
}

function activate() {
    $.ajax({
        type: "POST",
        url: "http://localhost:4567/activate",
        success: function() {
            $('#status').val(get_status())
        }
    })
}

function deactivate() {
    $.ajax({
        type: "POST",
        url: "http://localhost:4567/deactivate",
        success: function() {
            get_status()
        }
    })
}

function set_timer() {
    $.ajax({
        type: "POST",
        url: "http://localhost:4567/set/bomb_timer"
    })
}

function get_status() {
    $.ajax({
        type: "GET",
        url: "http://localhost:4567/status",
        dataType: 'text',
        success: function(data) {
            $('#status').val(data)
        }
    })
}
