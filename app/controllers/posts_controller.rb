class PostsController < Sinatra::Base

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
    end

    #display all posts
    get "/posts" do
        erb :posts
      end

    #display single post
    get "/posts/:id" do
        @post = Post.find_by_id(params[:id])
        erb :show_posts
    end

    
end
