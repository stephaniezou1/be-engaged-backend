class ElectionSerializer < ActiveModel::Serializer
  attributes :id, :electionId, :name, :electionDay, :ocdDivisionId
end
