class HumanBoardSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :ships
  has_many :moves
  has_many :cells
end
