Feature: Bomb Timer is set and bomb detonated
    In order to achieve world dominance
    a bomb needs to have its timer set and
    started for it to detonate

    @javascript
    Scenario: An unactivated bomb has the timer countdown started
        Given a bomb
        When I start the timer countdown
        Then Bomb status should be "DEACTIVATED"

    @javascript
    Scenario: Bomb has default timer used for countdown
        Given an activated bomb
        When I start the timer countdown
        Then Bomb status should be "ACTIVATED"

    @javascript
    Scenario: Bomb has timer set
        Given an activated bomb
        When I set the timer to "1:24:11"
        Then bomb timer should be "1:24:11"

    @javascript
    Scenario: Bomb has timer set to max value
        Given an activated bomb
        When I set the timer to "9:99:99"
        Then bomb timer should be "10:40:39"

    @javascript
    Scenario: Bomb is detonated
        Given an activated bomb
        When I set the timer to "0:00:00"
        Then Bomb status should be "BOOM"
