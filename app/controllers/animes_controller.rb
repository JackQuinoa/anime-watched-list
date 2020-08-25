class AnimesController < ApplicationController 
  
  get '/animes/anime_list' do 
    if logged_in?
      @list = Anime.all
      erb :'/animes/anime_list'
    else 
      redirect to '/users/login'
    end
  end
  
  get '/animes/add_anime' do 
    erb :'/animes/add_anime'
  end
  
  post '/animes/add_anime' do 
    @anime = current_user.animes.build(params)
    if @anime.save
      redirect to '/animes/anime_list'
    else 
      erb:'/animes/add_anime'
    end
  end
  
  get '/animes/:id/edit' do 
      @anime = Anime.find_by_id(params[:id])
      erb :"/animes/edit"
  end
  
  patch '/animes/:id' do 
    @anime = Anime.find_by_id(params[:id])
    @anime.update(title: params[:title])
    redirect to "/animes/anime_list"
  end
  
end