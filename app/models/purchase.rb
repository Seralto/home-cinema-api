class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option

  validates :user, presence: true
  validates :purchase_option, presence: true
  validates :date, presence: true
end
