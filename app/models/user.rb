class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :phone, :password_digest, :password_confirmation

  has_many :checkouts
  has_many :books, through: :checkouts
  has_many :checkins
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, :length => {:minimum => 6}
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
end
