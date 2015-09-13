require 'sinatra'
require 'pry'

get '/' do
  @ingredients = File.readlines('ingredients.txt')
  erb :index
end

post '/ingredients' do
  ingredient = params['ingredient']

  File.open('ingredients.txt', 'a') do |file|
    file.puts(ingredient)
  end

  redirect '/'
end


###this goes inside the terminal
# system ("curl -d content='3 tablespoons good olive oil'") http://localhost:4567/ingredients
