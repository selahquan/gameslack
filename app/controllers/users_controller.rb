require './config/environment'
require "./app/models/user"

class UsersController < ApplicationController
    
    get '/login' do 
        erb :login
      end
    
    post "/login" do
        if login(params[:email], params[:password])
            redirect "/posts"
        else
            redirect "/failure"
         end
      end

    get '/signup' do
        erb :signup
      end
    
    post '/signup' do
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save
            redirect '/login'
        else
            redirect '/failure'
        end
    end

    get "/account" do
        if logged_in?
          erb :account
        else
          redirect '/failure'
        end
      end

      get "/logout" do
        logout
        redirect "/"
      end
end