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
    if params[:rating].to_i.between?(1,10) && !params[:title].empty?
      @anime.save
      redirect to '/animes/anime_list'
    else 
      erb:'/animes/add_anime'
    end
  end
  
  get '/animes/:id/edit' do 
    @anime = Anime.find_by_id(params[:id])
    if @anime.user == current_user   
      erb :"/animes/edit"
    else 
      redirect to '/animes/anime_list'
    end
  end
  
  patch '/animes/:id' do 
    @anime = Anime.find_by_id(params[:id])
    if @anime.user == current_user && params[:rating].to_i.between?(1,10) && !params[:title].empty?
      @anime.update(title: params[:title], rating: params[:rating], comments: params[:comments])
    end
    redirect to "/animes/anime_list"
  end
  
  delete '/animes/:id' do 
    @anime = Anime.find_by_id(params[:id])
    if @anime.user == current_user
      @anime.delete
    end
    redirect to "/animes/anime_list"
  end
  
end