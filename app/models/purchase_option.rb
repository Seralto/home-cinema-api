class PurchaseOption < ApplicationRecord
  belongs_to :content
  has_many :purchases

  validates :price, presence: true
  validates :quality, presence: true
  validates :content, presence: true
end
