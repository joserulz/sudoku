Feature: Sudoku

    Scenario: Boton jugar visible en la UI
        Given I visit the homepage
        Then I should see "Jugar"

    Scenario: Cambiar valor a fila 1, columna 1
        Given I visit the homepage
        When I enter "3" in row 1, column 1
        And I press "Jugar"
        Then I should see "3" in row 1, column 1

    Scenario: Llenar el tablero correctamente, ver mensaje de ganador
        Given I visit the homepage
        When I enter "3" in row 1, column 1
        And I enter "1" in row 1, column 3
        And I enter "3" in row 2, column 2
        And I enter "2" in row 3, column 1
        And I enter "1" in row 3, column 2
        Then I should see "Ganaste!"
