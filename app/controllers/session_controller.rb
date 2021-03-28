require './config/environment'

class SessionsController < ApplicationController
    get '/login' do 
        erb :login

      end
    
    post "/login" do
        if login(params[:email], params[:password])
            redirect "/posts"
        else
          redirect_if_not_logged_in
         end
      end

      get "/logout" do
        logout
        redirect "/"
      end
end