class ShipSerializer < ActiveModel::Serializer
  attributes :id
  has_one :cell
end
