require 'sinatra'

enable :sessions

get '/' do
    @cells = [
        [nil,2,nil],
        [1,nil,2],
        [nil,nil,3]
    ];
    erb :sudoku
end

post '/sudoku' do
    @cells = params["cells"]
    puts "Parametros:"
    puts @cells
    erb :sudoku
end
