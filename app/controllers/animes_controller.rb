class AnimesController < ApplicationController 
  
  get '/animes' do 
    if logged_in?
      @list = Anime.all 
      erb :'/animes'
    else 
      redirect to '/users/login'
    end
  end
  
  get '/animes/new' do 
    erb :'/animes/new'
  end
  
  post '/animes' do 
    @anime = current_user.animes.build(params)
    if params[:rating].to_i.between?(1,10) && !params[:title].empty?
      @anime.save
      redirect to '/animes'
    else 
      erb:'/animes/new'
    end
  end
  
  get '/animes/:id/edit' do 
    @anime = Anime.find_by_id(params[:id])
    if @anime.user == current_user   
      erb :"/animes/edit"
    else 
      redirect to '/animes'
    end
  end
  
  patch '/animes/:id' do 
    @anime = Anime.find_by_id(params[:id])
    if @anime.user == current_user && params[:rating].to_i.between?(1,10) && !params[:title].empty?
      @anime.update(title: params[:title], rating: params[:rating], comments: params[:comments])
    end
    redirect to "/animes"
  end
  
  delete '/animes/:id' do 
    @anime = Anime.find_by_id(params[:id])
    if @anime.user == current_user
      @anime.delete
    end
    redirect to "/animes"
  end

  get '/animes/newest' do 
    if logged_in?
      @list = Anime.all 
      erb :'/animes/newest'
    else 
      redirect to '/users/login'
    end
  end
  
end


