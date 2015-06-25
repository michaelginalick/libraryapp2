class Checkin < ActiveRecord::Base
  attr_accessible :user_id, :book_id, :checkin_date

  belongs_to :user
  belongs_to :book
end
