class User < ApplicationRecord
  has_secure_password
  before_save { self.email = email.downcase}
  has_many :articles
  validates :username, presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 25 }
  validates :email, presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 105 },
    format: { with: URI::MailTo::EMAIL_REGEXP } # from Ruby standard library
end
