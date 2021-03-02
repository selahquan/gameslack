class PostsController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #display all posts
  get "/posts" do
    #@posts = Post.all
    erb :posts
  end

  #display create post form
  get "/posts/new" do
    erb :new_posts
  end

  #create post
  post "/posts" do
    @posts = Posts.create(:title => params[:title], :content => params[:content])
    redirect to "/posts/#{@posts.id}"
  end

  #display single post
  get "/posts/:id" do
    @post = Post.find_by_id(params[:id])
    erb :show_post
  end

  #load edit post form
  get "/posts/:id/edit" do
    @post = Post.find_by_id(params[:id])
    erb :editposts
  end

  #update post modifies existing post
  patch "/posts/:id" do
    @post = Post.find_by_id(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  #update action replace post
  # post "/posts/:id" do
  #   @post = Post.find_by_id(params[:id])
  #   erb :show_posts
  # end

  #delete post
  post "/posts/:id" do
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect to '/posts'
  end
end
