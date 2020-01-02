class Post < ApplicationRecord
    belongs_to :contractee
    belongs_to :contractor, optional: true
    has_many :comments, as: :commentable
    belongs_to :category

    validates :title, :description, :status, :category_id, presence: true
end
