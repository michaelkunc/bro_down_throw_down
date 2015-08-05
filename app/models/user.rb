class User < ActiveRecord::Base
  validates_uniqueness_of :username
  validates :username, presence: true
  validates :email, { presence: true, uniqueness: true }
  validates :password, length: {minimum: 6}
  validates :bio, length: {maximum: 1000}

  has_secure_password
end