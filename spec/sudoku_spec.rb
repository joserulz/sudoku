require_relative "../lib/sudoku.rb"

describe "Sudoku" do

    it "crear sudoku de tamanio 3 x 3" do
		tablero = [
				[nil, nil, 2],
				[nil, 1, nil],
				[nil, nil, nil]
			]
        game = SudokuGame.new tablero, nil, 3
 
        game.obtener_nro_filas.should == 3
        game.obtener_nro_columnas.should == 3
    end

    it "sudoku no debe tener el tablero vacio" do
		tablero = [
				[nil, nil, 2],
				[nil, 1, nil],
				[nil, nil, nil]
			]
        game = SudokuGame.new tablero, nil, 3
        game.obtener_num_celdas_llenas.should >= 1
    end

    it "sudoku valida que el numero'4' esta fuera de rango" do
		tablero = [
				[1, 2, 3],
				[2, 3, 1],
				[3, 1, 4]
			]
        game = SudokuGame.new tablero, nil, 3
		expect { game.validar_rango_numeros? }.to raise_error("Valor fuera de rango")
    end

    it "sudoku no debe tener celdas vacias" do
		tablero = [
				[1, 2, 3],
				[2, 3, 1],
				[3, 1, nil]
			]
        game = SudokuGame.new tablero, nil, 3
        expect { game.validar_celdas_llenas? }.to raise_error("Existen celdas vacias")
    end

    it "sudoku no debe tener filas repetidas" do
		tablero = [
				[1, 2, 2],
				[2, 3, 1],
				[3, 1, 2]
			]
        game = SudokuGame.new tablero, nil, 3
		expect { game.existen_repetidos_fila? }.to raise_error("Existen valores repetidos en fila")
    end

    it "sudoku envia el juego perfecto" do
		tablero = [
				[1, 2, 3],
				[2, 3, 1],
				[3, 1, 2]
			]
        game = SudokuGame.new tablero, nil, 3
        game.validar_reglas?.should == "Cumple con las reglas"
    end


end
