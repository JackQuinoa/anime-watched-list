class UsersController < ApplicationController 

  get '/users/new' do 
   erb :'/users/new'
  end
  
  post '/users/new' do 
    if params[:name].empty? || params[:password].empty?
      redirect to '/users/new'
    else
      @user = User.create(name: params[:name], password: params[:password])
      session[:user_id] = @user.id
      redirect to '/animes'
    end
  end

  get '/users/login' do
    erb :'/users/login'   
  end
  
  post '/users/login' do 
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/animes'
    else
      redirect to '/users/login'
    end
  end
  
  get '/users/logout' do 
    session.clear
    redirect to '/'
  end
  
end