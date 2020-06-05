class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :line1, :city, :state, :zip_code
  has_many :follows
end
