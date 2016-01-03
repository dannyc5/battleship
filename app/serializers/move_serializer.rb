class MoveSerializer < ActiveModel::Serializer
  attributes :id, :hit
  belongs_to :cell
end
