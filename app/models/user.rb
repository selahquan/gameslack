class User < ActiveRecord::Base
    has_many :games, :posts
end