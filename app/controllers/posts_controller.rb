class PostsController < ApplicationController


  #display all posts
  get "/posts" do
    @posts = Post.all
    erb :posts
  end

  #display create post form
  get "/posts/new" do
    get_post
    redirect_if_not_logged_in
    redirect 'login'
  end

  #create post
  post '/posts' do
    @post = Post.new(params)
    @post.user_id = current_user.id
    if !@post.title.blank? || !@post.content.blank?
      @post.save
    end
    redirect to "/posts/#{@post.id}"
  end

  #view post
  get "/posts/:id" do
    @post = get_post
    erb :posts_show
  end

  #load edit post form
  get "/posts/:id/edit" do
    get_post
    redirect_if_not_owner
    erb :posts_edit
    
    
    # if logged_in? && @post.user_id == current_user.id
    #   erb :posts_edit
    # else
    #   flash[:error] = "You must be logged in to edit post."
    #   redirect '/posts'
    # end
  end

  patch '/post/:id' do
    get_post
    if @post.user_id == current_user.id
      @post.update(title: params[:title], content: params[:content])
    else
      flash[:error] = "You can only delete posts that you created."
      
    end
    redirect '/posts'
    
  end

  #delete post
  delete "/post/:id" do
    get_post
    if @post.user_id == current_user.id
      @post.destroy
    else
      flash[:error] = "You can only delete posts that you created."
    end
    redirect to '/posts'
  end
end
