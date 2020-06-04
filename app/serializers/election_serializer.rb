class ElectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :electionDay, :ocdDivisionId
end
