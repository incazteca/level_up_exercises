Feature: Bomb is activated
    In order to achieve world dominance
    A bomb needs to be activated to go off

    @javascript
    Scenario: Bomb is turned on deactivated
        Given a bomb
        When I turn the bomb on
        Then Bomb status should be "DEACTIVATED"

    @javascript
    Scenario: Bomb is activated
        Given a bomb
        When I activate it
        Then Bomb status should be "ACTIVE"

    @javascript
    Scenario: Bomb is given new activation code
        Given a bomb
        When I set a new activation code and activate bomb with it
        Then Bomb status should be "ACTIVE"
