class Account < ApplicationRecord
  has_many :addresses
  has_many :profiles

  validates :email, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  has_secure_password
end
