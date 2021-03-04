class PostsController < ApplicationController

  # configure do
  #   set :public_folder, 'public'
  #   set :views, 'app/views'
  # end

  #display all posts
  get "/posts" do
    @posts = Post.all
    erb :posts
  end

  #display create post form
  get "/posts/new" do
    if !logged_in?
    redirect "/login"
    else
    erb :posts_new
    end
  end

  #create post
  post "/posts" do
    @posts = Posts.create(:title => params[:title], :content => params[:content], :user_id =>session[user_id])
    redirect to "/posts/#{@posts.id}"
  end

  #display single post
  get "/posts/:id" do
    @post = Post.find_by_id(params[:id])
    erb :show_post
  end

  #load edit post form
  get "/posts/:id/edit" do
    if !logged_in?
      redirect "/login"
    else
      if post = current_user.posts.find_by(params[:id])
       erb :editposts
      else
        redirect '/posts'
      end
    end
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
