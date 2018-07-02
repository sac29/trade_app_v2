class MongoLike
  include Mongoid::Document
  include Mongoid::Timestamps

  field :trade_id, type: Integer
  field :user_ids, type: Array, default: []

end
