Feature: Sudoku

    Scenario: Boton jugar visible en la UI
        Given I visit the homepage
        Then I should see "Jugar"

    Scenario: Cambiar valor a fila 1, columna 1
        Given I visit the homepage
        When I enter "3" in row 1, column 1
        And I press "Jugar"
        Then I should see "3" in row 1, column 1
