class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :created_at, :updated_at, :category, :status, :contractee, :contractor
end
