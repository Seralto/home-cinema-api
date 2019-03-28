class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option

  validates :user, presence: true
  validates :purchase_option, presence: true

  ALIVE_TIME = 2.days

  scope :active, -> { where('created_at >= ?', Date.today - ALIVE_TIME)}
  scope :ordered, -> { order(created_at: :asc)}

  def active?
    created_at >= (Date.today - ALIVE_TIME)
  end
end
