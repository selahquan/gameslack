class PostsController < ApplicationController


  #display all posts
  get "/posts" do
    @posts = Post.all
    erb :posts
  end

  #display create post form
  get "/posts/new" do
    if !logged_in?
      flash[:error] = "You must be logged in to post."
      redirect 'login'
    else
      erb :posts_new
    end
  end

  #create post
  post '/posts' do
    @post = Post.create(params)
    @post.user_id = current_user.id
    if !@post.title.blank? || !@post.content.blank?
      @post.save
    end
    redirect to "/posts/#{@post.id}"
  end

  #view post
  get "/posts/:id" do
    @post = Post.find(params[:id])
    erb :posts_show
  end

  #edit post
  patch 'posts/:id' do
    @post = Post.find_by_id(params[:id])
    if @post.user_id == current_user.email
      @post.title = params[:title]
      @post.content = params[:content]
      @post.user_id = params[:user_id]
      @post.save
      redirect to "/posts/#{@post.id}"
    else
      redirect '/posts'
    end
  end

  #load edit post form
  get "/posts/:id/edit" do
    @post = Post.find_by_id(params[:id])
    if logged_in? && @post.user_id == session[:email]
      erb :posts_edit
    else
      flash[:error] = "You must be logged in to edit post."
      redirect '/posts'
    end
  end

  #delete post
  delete "/posts/:id" do
    @post = Post.find_by_id(params[:id])
    if @post.user_id == current_user.id
      @post.delete
      redirect to '/posts'
    else
      flash[:error] = "You can only delete posts that you created."
      redirect '/posts'
    end
  end
end
