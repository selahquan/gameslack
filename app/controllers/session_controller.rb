require './config/environment'

class SessionsController < ApplicationController
    get '/login' do 
        erb :login

      end
    
    post "/login" do
        if login(params[:email], params[:password])
            redirect "/posts"
        else
          #flash[:error] = "Invalid email or password."
          redirect "/failure"
         end
      end

      get "/logout" do
        logout
        redirect "/"
      end
end