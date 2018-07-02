class MongoLike
  include Mongoid::Document
  include Mongoid::Timestamps

  field :trade_id, type: Integer
  field :likes, type: [Integer]

  validates_uniqueness_of :likes

end
