require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "passwordspassword" 
  end

  get "/" do
    erb :index
  end
  
  get "/animes" do 
    @animes = Anime.all 
    erb :animes 
  end
  
  get "/sign_up" do 
    erb :sign_up
  end
  
  get "/sign_in" do 
    erb :sign_in
  end
  
  get "/details" do 
    erb :details
  end
  
  get "/add_anime" do 
    erb :add_anime
  end
  
end
