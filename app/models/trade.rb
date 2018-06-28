class Trade < ApplicationRecord
  self.table_name = "trades"
  validates :company_name, length: {minimum: 1}
  validates :no_of_stocks, numericality: { only_integer: true, greater_than: 0 }
  validates :stock_price, numericality: { greater_than: 0 }
  validates :has_share, inclusion: { in: [true, false] }
  validates :action_date, presence: true
  belongs_to :user
  has_many :comments
end