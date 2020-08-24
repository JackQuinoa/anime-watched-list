class UsersController < ApplicationController 

  get '/signup' do 
   erb :'users/signup'
  end
  
  post '/signup' do 
    if params[:name].empty? || params[:password].empty?
      redirect to '/signup'
    else
      @user = User.create(name: params[:name], password: params[:password])
      session[:user_id] = @user.id
      redirect to '/login'
    end
  end
  
  get '/login' do
    erb :'users/login'   
  end
  
  post '/login' do 
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/animes'
    else
      redirect to '/login'
    end
  end
  
end