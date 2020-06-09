class FollowSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :election_id 
end
