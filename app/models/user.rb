class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: true
  validates :username, length: { minimum: 6 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
