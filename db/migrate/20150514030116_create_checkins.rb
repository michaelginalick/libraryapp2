class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|

      t.integer     :user_id
      t.integer     :book_id
      t.date        :checkin_date

      t.timestamps
    end
  end
end
