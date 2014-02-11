class User < ActiveRecord::Base
  has_secure_password
  has_many :blurts
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
