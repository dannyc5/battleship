class ShipSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :cell
end
