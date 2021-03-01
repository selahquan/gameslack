class ApplicationController < Sinatra::Base

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
    end

    get "/posts" do
        erb :posts
      end

    
end
