require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "passwordspassword" 
  end

  get '/' do
    erb :index
  end
  

  
  post '/signup' do 
    
  end
  
  
  
  get '/details' do 
    erb :details
  end
  
  get '/add_anime' do 
    erb :add_anime
  end
  
  helpers do 
    
  end

end
