class UsersController < ApplicationController 

  get '/signup' do 
   erb :'users/signup'
  end
  
  post '/signup' do 
    @user = User.new(name: params["name"], password: params["password"])
    redirect to '/login'
  end
  
  get '/login' do
    erb :'users/login'   
  end
  
  post '/login' do 
    erb :"/animes/animes"
  end
  
end