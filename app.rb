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
    puts @cells
    erb :sudoku
end

post '/sudoku' do
    @cells = params["cells"]
	puts "ENTRADA DEL POST"
	puts @cells
	tablero = transformar_a_arreglo @cells
	rango = [1, 2, 3]
	puts "ENTRADA A LA CLASE"
	puts tablero
	game = SudokuGame.new tablero, rango
	@respuesta = game.validar_reglas?
    erb :sudoku
end
