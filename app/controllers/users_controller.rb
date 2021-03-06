require './config/environment'
require "./app/models/user"

class UsersController < ApplicationController

    get '/signup' do
        erb :signup
      end
    
    post '/signup' do
        @user = User.new(params)
        if !@user.email.empty? && !@user.password.empty? && !@user.email.find_by_email(params[:email])
          @user.save
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

    patch "/account" do
      if logged_in?
        current_user.email = params[:email]
      else
      redirect "/login"
      end
    end
end