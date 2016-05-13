require_relative "./lib/constants.rb"
require_relative "./lib/sudoku.rb"
require_relative "./lib/helper.rb"

require 'sinatra'


enable :sessions

get '/' do
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
#		tablero = [
#		    [7,4,9, 6,8,5, 2,1,3],
#		    [3,2,5, 1,7,9, 6,4,8],
#		    [8,1,6, 3,4,2, 5,9,7],
#		    [4,6,7, 9,5,3, 8,2,1],
#		    [9,5,8, 2,1,7, 4,3,6],
#		    [1,3,2, 4,6,8, 7,5,9],
#		    [6,7,1, 5,3,4, 9,8,2],
#		    [2,8,4, 7,9,1, 3,6,5],
#		    [5,9,3, 8,2,6, 1,7,4]
#		]
    session["game"] = SudokuGame.new tablero, SUDOKU_ROWS, SUDOKU_COLS, SUDOKU_MAX_VALUE
    @game = session["game"]
    erb :sudoku
end

post '/sudoku' do
    cells = params["cells"]
    @game = session["game"]
    tablero = transformar_a_arreglo cells
    @game.procesar_tablero tablero
    @game.validar_tablero
    @validacion = @game.resultado_validacion
    erb :sudoku
end
