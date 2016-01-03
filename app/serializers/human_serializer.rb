class HumanSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :board
end
