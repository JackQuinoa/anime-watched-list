
class AnimesController < ApplicationController 
  
  get '/animes' do 
    @animes = Anime.all 
    erb :animes 
  end

   get '/details' do 
    erb :details
  end
  
  get '/add_anime' do 
    erb :add_anime
  end

end