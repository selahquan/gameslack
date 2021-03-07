require './config/environment'
require "./app/models/user"

class UsersController < ApplicationController

    get '/signup' do
        erb :signup
      end
    
    post '/signup' do
        @user = User.new(params)
        if !@user.email.blank? && !@user.password.blank? && !@user.email.find_by_email(params[:email])
          @user.save
          redirect '/login'
        else
          flash[:error] = "Invalid email or password. Or user already exists."
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