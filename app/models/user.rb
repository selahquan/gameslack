class User < ActiveRecord::Base
    #has_many :games, :posts
    has_secure_password
end