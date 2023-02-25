class Payment < ApplicationRecord
  belongs_to :group
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :name, presence: true
  validates :group, presence: true
  validates :amount, presence: true, numericality: true, comparison: { greater_than_or_equal_to: 0 }
end
