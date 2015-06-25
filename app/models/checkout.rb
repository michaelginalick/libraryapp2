class Checkout < ActiveRecord::Base

  attr_accessible :user_id, :book_id, :start_date, :due_date

  belongs_to :user
  belongs_to :book
end
