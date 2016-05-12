require_relative "../lib/sudoku.rb"

describe "Sudoku" do

    it "sudoku tiene 3 x 3" do
		tablero = [
				[nil, nil, 2],
				[nil, 1, nil],
				[nil, nil, nil]
			]
		rango = [1, 2, 3, nil] 
        game = SudokuGame.new tablero, rango
 
        game.obtener_nro_filas.should == 3
        game.obtener_nro_columnas.should == 3
    end

    it "sudoku tenga almenos un valor inicial" do
		tablero = [
				[nil, nil, 2],
				[nil, 1, nil],
				[nil, nil, nil]
			]
		rango = [1, 2, 3, nil] 
        game = SudokuGame.new tablero, rango
        game.obtener_num_celdas_llenas.should >= 1
    end

    it "sudoku no tiene elementos diferentes a {1, 2, 3}" do
		tablero = [
				[nil, nil, 2],
				[nil, 1, nil],
				[nil, nil, nil]
			]
		rango = [1, 2, 3, nil] 
        game = SudokuGame.new tablero, rango
        game.validar_rango_numeros?.should == true
    end


end
