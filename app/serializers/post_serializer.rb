class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :discription, :created_at, :updated_at
end
