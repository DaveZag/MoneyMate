class Group < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  def latest_payments
    payments.order(:desc).limit(5)
  end

  def total_amount
    payments.sum(:amount)
  end
end
