class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
    has_many :coins, serializer: UserCoinSerializer
end
