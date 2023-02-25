class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :payments, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  def latest_payments
    payments.order(created_at: :desc).limit(5)
  end

  def total_amount
    payments.sum(:amount)
  end
end
