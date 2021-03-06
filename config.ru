require './config/environment'
require './app/controllers/games_controller'
require './app/controllers/posts_controller'
require './app/controllers/users_controller'

#if ActiveRecord::Migrator.needs_migration?
#  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
#end

use Rack::MethodOverride
use PostsController
use GamesController
use UsersController
use SessionsController
run ApplicationController
