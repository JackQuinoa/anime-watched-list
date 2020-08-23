class UsersController < ApplicationController 
 
  get '/signup' do 
    erb :signup
  end
  
  post '/signup' do 
    
  end
  
  get '/login' do
    erb :login   
  end
  
end