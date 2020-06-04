class ElectionSerializer < ActiveModel::Serializer
  attributes :electionId, :name, :electionDay, :ocdDivisionId
end
