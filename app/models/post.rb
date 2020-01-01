class Post < ApplicationRecord
    has_many :tasks
    has_many :contractees, through: :tasks
    has_many :comments, as: :commentable
end
