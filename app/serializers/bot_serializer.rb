class BotSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :board, serializer: SecretBoardSerializer
  has_many :moves
end
