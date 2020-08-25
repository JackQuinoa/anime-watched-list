class UsersController < ApplicationController 

  get '/users/signup' do 
   erb :'/users/signup'
  end
  
  post '/users/signup' do 
    if params[:name].empty? || params[:password].empty?
      redirect to '/users/signup'
    else
      @user = User.create(name: params[:name], password: params[:password])
      session[:user_id] = @user.id
      redirect to '/animes/anime_list'
    end
  end

  get '/users/login' do
    erb :'/users/login'   
  end
  
  post '/users/login' do 
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/animes/anime_list'
    else
      redirect to '/users/login'
    end
  end
  
  get '/users/logout' do 
    session.clear
    redirect to '/'
  end
  
end