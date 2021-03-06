class PostsController < ApplicationController


  #display all posts
  get "/posts" do
    @posts = Post.all
    erb :posts
  end

  #display create post form
  get "/posts/new" do
    if !logged_in?
      redirect 'login'
      #flash message you must be logged in to post.
    else
      erb :posts_new
    end
  end

  #create post
  post '/posts' do
    @post = Post.create(params)
    @post.user_id = current_user.id
    @post.save
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
    @post.title = params[:title]
    @post.content = params[:content]
    @post.user_id = params[:user_id]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  #load edit post form
  get "/posts/:id/edit" do
    @post = Post.find_by_id(params[:id])
    if @post.user_id == current_user.id
      erb :posts_edit
    else
      redirect '/posts'
      #flash message you must be logged in to post.
    end
  end

  #delete post
  delete "/posts/:id" do
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect to '/posts'
  end
end
