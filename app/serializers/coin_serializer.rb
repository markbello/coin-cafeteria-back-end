class CoinSerializer < ActiveModel::Serializer
  attributes :id, :symbol
  has_many :users, serializer: UserCoinSerializer
end
