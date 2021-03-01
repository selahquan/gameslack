require './config/environment'
require "./app/models/user"
require "./app/models/post"
require "./app/models/game"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

end
 