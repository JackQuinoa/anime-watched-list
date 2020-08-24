class UsersController < ApplicationController 

  get '/signup' do 
   erb :'users/signup'
  end
  
  post '/signup' do 
    @user = User.new do |u|
      u.name = params[:name]
      u.password = params[:password]
    end
    redirect to '/login'
  end
  
  
  
  
  
  
  
  
  
  
  get '/login' do
    erb :'users/login'   
  end
  
  post '/login' do 
    @user = User.find_by(name:params[:name])
     if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/animes/animes'
    else
      redirect to '/index'
    end
  end
  
end