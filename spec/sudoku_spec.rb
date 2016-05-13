require_relative "../lib/constants.rb"
require_relative "../lib/sudoku.rb"

describe "Sudoku" do

    it "crear sudoku de tamanio rows x cols" do
		tablero = [
				[nil, nil, 2, nil, nil, nil, nil, nil, nil],
				[nil, 1, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil]
			]
        game = SudokuGame.new tablero, SUDOKU_ROWS, SUDOKU_COLS, SUDOKU_MAX_VALUE
 
        game.obtener_nro_filas.should == SUDOKU_ROWS
        game.obtener_nro_columnas.should == SUDOKU_COLS
    end

    it "sudoku no debe tener el tablero vacio" do
		tablero = [
				[nil, nil, 2, nil, nil, nil, nil, nil, nil],
				[nil, 1, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil, nil, nil, nil, nil]
			]
        game = SudokuGame.new tablero, SUDOKU_ROWS, SUDOKU_COLS, SUDOKU_MAX_VALUE
        game.obtener_num_celdas_llenas.should >= 1
    end

    it "sudoku valida que el numero '10' esta fuera de rango" do
		tablero = [
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, nil, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9]
			]
        game = SudokuGame.new tablero, SUDOKU_ROWS, SUDOKU_COLS, SUDOKU_MAX_VALUE
        tablero[2][2] = 10
        game.procesar_tablero tablero
        expect(game.resultado_validacion).to include("Valor fuera de rango en fila 3, columna 3")
    end

    it "sudoku no debe tener celdas vacias" do
		tablero = [
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, nil]
			]
        game = SudokuGame.new tablero, SUDOKU_ROWS, SUDOKU_COLS, SUDOKU_MAX_VALUE
        game.validar_tablero
        expect(game.resultado_validacion).to include("Casillero vacio en fila 9, columna 9")
    end

    it "sudoku no debe tener filas repetidas" do
		tablero = [
				[1, 2, 2, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, nil]
			]
        game = SudokuGame.new tablero, SUDOKU_ROWS, SUDOKU_COLS, SUDOKU_MAX_VALUE
        game.validar_tablero
        expect(game.resultado_validacion).to include("Valor '2' repetido en fila 1")
    end

    it "sudoku no debe mostrar valor repetido para nil" do
		tablero = [
				[1, 2, 2, 4, nil, 6, nil, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, 6, 7, 8, 9],
				[1, 2, 3, 4, 5, nil, 7, 8, nil]
			]
        game = SudokuGame.new tablero, SUDOKU_ROWS, SUDOKU_COLS, SUDOKU_MAX_VALUE
        game.validar_tablero
        expect(game.resultado_validacion).to_not include("Valor '' repetido en fila 1")
        expect(game.resultado_validacion).to_not include("Valor '' repetido en fila 9")
    end

    it "sudoku envia el juego perfecto" do
		tablero = [
		    [nil,4,nil, 6,nil,nil, nil,1,nil],
		    [nil,nil,5, nil,7,9, nil,nil,nil],
		    [8,1,nil, nil,nil,nil, 5,9,nil],
		    [4,nil,nil, nil,5,nil, nil,2,nil],
		    [9,nil,8, nil,nil,7, 4,nil,6],
		    [nil,nil,nil, 4,6,8, nil,5,nil],
		    [nil,7,1, 5,nil,4, nil,8,nil],
		    [nil,nil,4, nil,9,nil, nil,6,nil],
		    [nil,nil,nil, nil,2,nil, nil,nil,nil]
		]
        game = SudokuGame.new tablero, SUDOKU_ROWS, SUDOKU_COLS, SUDOKU_MAX_VALUE
		tablero = [
		    [7,4,9, 6,8,5, 2,1,3],
		    [3,2,5, 1,7,9, 6,4,8],
		    [8,1,6, 3,4,2, 5,9,7],
		    [4,6,7, 9,5,3, 8,2,1],
		    [9,5,8, 2,1,7, 4,3,6],
		    [1,3,2, 4,6,8, 7,5,9],
		    [6,7,1, 5,3,4, 9,8,2],
		    [2,8,4, 7,9,1, 3,6,5],
		    [5,9,3, 8,2,6, 1,7,4]
		]
        game.procesar_tablero tablero
        expect(game.resultado_validacion).to be_empty
    end

    it "Coloco 2 en toda una fila" do
		tablero = [
		    [2,2,2, 2,2,2, 2,2,2],
		    [3,2,5, 1,7,9, 6,4,8],
		    [8,1,6, 3,4,2, 5,9,7],
		    [4,6,7, 9,5,3, 8,2,1],
		    [9,5,8, 2,1,7, 4,3,6],
		    [1,3,2, 4,6,8, 7,5,9],
		    [6,7,1, 5,3,4, 9,8,2],
		    [2,8,4, 7,9,1, 3,6,5],
		    [5,9,3, 8,2,6, 1,7,4]
		]
        game = SudokuGame.new tablero, SUDOKU_ROWS, SUDOKU_COLS, SUDOKU_MAX_VALUE
        game.validar_tablero
        expect(game.resultado_validacion).to include("Valor '2' repetido en fila 1")
    end


end
