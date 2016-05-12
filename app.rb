require 'sinatra'

enable :sessions

get '/' do

	erb :sudoku

end
