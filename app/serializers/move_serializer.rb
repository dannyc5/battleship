class MoveSerializer < ActiveModel::Serializer
  attributes :id, :hit
  has_one :cell
end
