class Group < ApplicationRecord
    belongs_to :user
    has_many :payments, dependent: :destroy

    validates :name, :icon, presence: true


end
