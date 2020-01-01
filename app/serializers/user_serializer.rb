class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :phone, :country, :city, :contractor, :contractee
end
