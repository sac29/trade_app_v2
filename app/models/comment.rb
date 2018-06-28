class Comment < ApplicationRecord
  self.table_name = "comments"
  validates :comment, presence: true, length: { minimum: 1 }
  belongs_to :trade
  belongs_to :user
end