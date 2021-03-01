class PostsController < Sinatra::Base

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
    end

    #display available games
    get "/games" do
      @games = Game.all
        erb :games
      end

    #display game details
    get "/games/:id" do
      @games = Game.find_by_id(params[:id])
        erb :games_details
      end

end
