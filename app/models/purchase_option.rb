class PurchaseOption < ApplicationRecord
  belongs_to :content

  validates :price, presence: true
  validates :quality, presence: true
  validates :content, presence: true
end
