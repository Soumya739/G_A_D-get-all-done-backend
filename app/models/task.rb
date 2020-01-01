class Task < ApplicationRecord
    belongs_to :contractee
    belongs_to :posts
end
