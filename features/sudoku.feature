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
        When I fill the table correctly
        And I press "Jugar"
        Then I should see "Ganaste!"

    Scenario: Entro a jugar e ingreso un valor 10
        Given I visit the homepage
        When I enter "10" in row 1, column 1
        And I press "Jugar"
        Then I should see "Valor fuera de rango en fila 1, columna 1"

    Scenario: Entro a jugar e ingreso un mismo valor en una fila
        Given I visit the homepage
        When I enter "2" in row 1, column 1
        And I enter "2" in row 1, column 3
        And I press "Jugar"
        Then I should see "Valor '2' repetido en fila 1"

    Scenario: Entro a jugar e ingreso una letra en una fila 1, columna 1
        Given I visit the homepage
        When I enter "a" in row 1, column 1
        And I press "Jugar"
        Then I should see "Valor fuera de rango en fila 1, columna 1"


    Scenario: Entro a jugar e ingreso un número negativo en una fila 1, columna 1
        Given I visit the homepage
        When I enter "-1" in row 1, column 1
        And I press "Jugar"
        Then I should see "Valor fuera de rango en fila 1, columna 1"

    Scenario: Completo el tablero e inicio un nuevo juego
        Given I visit the homepage
        When I fill the table correctly
        And I press "Jugar"
        And I press "Nuevo Juego"
        Then I should not see "Nuevo Juego"
