require_relative "../lib/sudoku.rb"

describe "Sudoku" do

    it "crear sudoku de tamanio 3 x 3" do
		tablero = [
				[nil, nil, 2],
				[nil, 1, nil],
				[nil, nil, nil]
			]
        game = SudokuGame.new tablero, 3
 
        game.obtener_nro_filas.should == 3
        game.obtener_nro_columnas.should == 3
    end

    it "sudoku no debe tener el tablero vacio" do
		tablero = [
				[nil, nil, 2],
				[nil, 1, nil],
				[nil, nil, nil]
			]
        game = SudokuGame.new tablero, 3
        game.obtener_num_celdas_llenas.should >= 1
    end

    it "sudoku valida que el numero'4' esta fuera de rango" do
		tablero = [
				[1, 2, 3],
				[2, 3, 1],
				[3, 1, 4]
			]
        game = SudokuGame.new tablero, 3
        game.validar_tablero
        expect(game.resultado_validacion).to include("Valor fuera de rango en fila 3, columna 3")
    end

    it "sudoku no debe tener celdas vacias" do
		tablero = [
				[1, 2, 3],
				[2, 3, 1],
				[3, 1, nil]
			]
        game = SudokuGame.new tablero, 3
        game.validar_tablero
        expect(game.resultado_validacion).to include("Casillero vacio en fila 3, columna 3")
    end

    it "sudoku no debe tener filas repetidas" do
		tablero = [
				[1, 2, 2],
				[2, 3, 1],
				[3, 1, 2]
			]
        game = SudokuGame.new tablero, 3
        game.validar_tablero
        expect(game.resultado_validacion).to include("Valor '2' repetido en fila 1")
    end

    it "sudoku no debe mostrar valor repetido para nil" do
        tablero = [
            [nil, 2, nil],
            [1, nil, 2],
            [nil, nil, 3]
        ]
        game = SudokuGame.new tablero, 3
        game.validar_tablero
        expect(game.resultado_validacion).to_not include("Valor '' repetido en fila 1")
        expect(game.resultado_validacion).to_not include("Valor '' repetido en fila 3")
    end

    it "sudoku envia el juego perfecto" do
		tablero = [
				[1, 2, 3],
				[2, 3, 1],
				[3, 1, 2]
			]
        game = SudokuGame.new tablero, 3
        game.validar_tablero
        expect(game.resultado_validacion).to be_empty
    end

    it "Coloco 2 en toda una fila" do
		tablero = [
				[2, 2, 2],
				[1, 3, 2],
				[3, 1, 2]
			]
        game = SudokuGame.new tablero, 3
        game.validar_tablero
        expect(game.resultado_validacion).to include("Valor '2' repetido en fila 1")
    end


end
