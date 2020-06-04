class HometownSerializer < ActiveModel::Serializer
  attributes :id, :pollingLocations, :contests, :elections
end
