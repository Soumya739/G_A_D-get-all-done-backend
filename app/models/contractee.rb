class Contractee < ApplicationRecord
    belongs_to :user
    has_many :tasks
    has_many :posts, through: :tasks
end
