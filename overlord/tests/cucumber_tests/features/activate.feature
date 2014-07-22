Feature: Bomb is activated
    In order to achieve world dominance
    A bomb needs to be activated to go off

    Scenario: Bomb is turned on deactivated
        Given a bomb
        When I turn the bomb on
        Then Bomb status should be "Deactivated"

    Scenario: Bomb is activated
        Given a bomb
        When I activate it
        Then Bomb status should be "Active"

