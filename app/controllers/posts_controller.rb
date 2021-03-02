class PostsController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #display all posts
  get "/posts" do
    @posts = Article.all
    erb :posts
  end

  #display create post form
  get "/posts/new" do
    erb :new_posts
  end

  #create post
  post "/posts" do
     #erb :posts
  end

  #display single post
  get "/posts/:id" do
    @post = Post.find_by_id(params[:id])
    erb :show_posts
  end

  #edit post
  get "/posts/:id/edit" do
    erb :editposts
  end

  #update post modifies existing post
  post "/posts/:id" do
    @post = Post.find_by_id(params[:id])
      erb :show_posts
  end

  #update action replace post
  post "/posts/:id" do
    @post = Post.find_by_id(params[:id])
    erb :show_posts
  end

  #delete post
  post "/posts/:id" do
    @post = Post.find_by_id(params[:id])
    erb :show_posts
  end
end
