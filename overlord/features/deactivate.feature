Feature: Bomb is deactivated
    In order to transport world dominance mechanism
    safely a bomb needs to be deactivated.

    Scenario: Bomb is deactivated
        Given an activated bomb
        When I deactivate it
        Then Bomb status should be "DEACTIVATED"

    Scenario: Bomb is given a new deactivation code
        Given an activated bomb
        When I set a new deactivation code and deactive bomb with it
        Then Bomb status should be "DEACTIVATED"

    Scenario: Bomb is unsuccesfully deactivated three times and explodes
        Given an activated bomb
        When I unsuccessfully deactivate the bomb 3 times
        Then Bomb status should be ""
