class Content < ApplicationRecord
  has_many :purchase_options

  validates :title, presence: true
  validates :plot, presence: true
  validates :type, presence: true

  scope :by_type, -> type { where(type: type) }
  scope :ordered, -> { order(created_at: :asc) }
end