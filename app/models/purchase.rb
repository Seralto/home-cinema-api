class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option

  ALIVE_TIME = 2.days

  scope :active, -> { where('purchases.created_at >= ?', Date.today - ALIVE_TIME)}
  scope :ordered, -> { order(created_at: :asc)}

  validates :user, presence: true
  validates :purchase_option, presence: true
  validates :user_id, uniqueness: {
    scope: :purchase_option_id,
    message: "user already has this content, and it is still available",
    conditions: -> { active }
  }
end
