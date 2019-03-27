class User < ApplicationRecord
  has_many :purchases

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
