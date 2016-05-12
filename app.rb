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
    puts "Parametros:"
    puts @cells
    erb :sudoku
end
