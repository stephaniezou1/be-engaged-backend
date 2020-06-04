class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password_digest, :line1, :city, :state, :zip
  has_many :followings
end
