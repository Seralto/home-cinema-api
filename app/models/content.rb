class Content < ApplicationRecord
  has_many :purchase_options

  validates :title, presence: true
  validates :plot, presence: true
  validates :type, presence: true
end
