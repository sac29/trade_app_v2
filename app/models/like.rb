class Like < ApplicationRecord
  self.table_name = "likes"
  validates :user_id, presence: true
  validates :trade_id, presence: true
  validates_uniqueness_of :user_id, :scope => :trade_id
  belongs_to :user
  belongs_to :trade
end