class SecretBoardSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :player, polymorphic: true
end
