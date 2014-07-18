Feature: Bomb is deactivated
    In order to transport world dominance mechanism
    safely a bomb needs to be deactivated.

    Scenario: Bomb is deactivated
        Given an activated bomb
        When I deactivate it
        Then Bomb status should be "Deactivated"

