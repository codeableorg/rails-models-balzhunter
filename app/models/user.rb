class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: true
  validates :username, length: { minimum: 6 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :birth_date_can_not_be_more_than_hundred_twenty, :cant_be_in_the_future

  def birth_date_can_not_be_more_than_hundred_twenty
    is_greater_than = Time.zone.today - birth_date > 120 * 365
    errors.add(:birth_date, "can't be more than 120 years ago") if is_greater_than
  end

  def cant_be_in_the_future
    errors.add(:birth_date, "can't be in the future") if birth_date > Time.zone.today
  end
end
