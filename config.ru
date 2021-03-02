require './config/environment'
require './app/controllers/games_controller'
require './app/controllers/posts_controller'

#if ActiveRecord::Migrator.needs_migration?
#  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
#end

use PostsController
use GamesController
run ApplicationController
