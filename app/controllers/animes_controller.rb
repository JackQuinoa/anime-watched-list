class AnimesController < ApplicationController 
  
  get /'animes/anime_list' do 
    if logged_in?
      @list - Anime.all
      erb :'/animes/anime_list'
    else 
      redirect to '/users/login'
    end
  end
  
end