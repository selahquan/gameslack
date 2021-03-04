require './config/environment'
require "./app/models/user"
require "./app/models/post"
require "./app/models/game"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "gameslack"
  end

  get "/" do
    erb :welcome
  end

  get "/failure" do
    erb :failure
  end

  helpers do

    def login(email, password)
      user = User.find_by(:email => params[:email])
		  if user && user.authenticate(params[:password])
			  session[:email] = user.email
      else
        redirect '/login'
      end
    end
         
    def logged_in?
      !!current_user
    end
    
    def logout
      session.clear
    end

    def current_user
      @current_user ||= User.find_by(:email => session[:email]) if session[:email]
      #User.find(session[:user_id])
    end
  end

end
 