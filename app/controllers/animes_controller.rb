
class AnimesController < ApplicationController 
  
  get '/animes' do 
    erb :animes 
  end

   get '/details' do 
    erb :details
  end
  
  get '/add_anime' do 
    erb :add_anime
  end

end