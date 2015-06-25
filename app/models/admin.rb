class Admin < ActiveRecord::Base
  attr_accessible :email, :password

  has_secure_password
  validates :email, presence: true
  validates :password, :length => {:minimum => 6}
end
