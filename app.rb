require_relative "./lib/sudoku.rb"
require_relative "./lib/helper.rb"

require 'sinatra'


enable :sessions

get '/' do
    @cells = {
        "0"=>{
            "0" => nil,
            "1" => 2,
            "2" => nil
        },
        "1"=>{
            "0" => 1,
            "1" => nil,
            "2" => 2
        },
        "2"=>{
            "0" => nil,
            "1" => nil,
            "2" => 3
        }
    }
    puts @cells3
    session['cells'] = transformar_a_arreglo @cells
    erb :sudoku
end

post '/sudoku' do
    @cells = params["cells"]
	puts "ENTRADA DEL POST"
	puts @cells
	tablero = transformar_a_arreglo @cells
	puts "ENTRADA A LA CLASE"
	game = SudokuGame.new tablero, nil, 3
	game.validar_tablero
	@validacion = game.resultado_validacion
    erb :sudoku
end
