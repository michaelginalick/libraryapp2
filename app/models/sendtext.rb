require 'Date'

class SendText

  def get_date
    date = DateTime.now.to_date
  end

  def user_due_date
    users = User.all
    user_due_date = users.checkouts.where(due_date: get_date).pluck(:user_id, :book_id)
  end

  def mod_num(num)
    user_num = num.to_s
    add_area_code = 1.to_s+num
    new_num = add_area_code.to_i

    return num_num
  end

  def sms_text
    sid = ENV["TWSID"]
    token = ENV["TOKEN"]
    # Instantiate a Twilio client
    client = Twilio::REST::Client.new(sid, token)
    from = ENV["FROM"]
    #loop through objects and get userphone and book
    user_due_date.each do |i|
      i.each do |info|
        user = User.find(info)
        book = Book.find(info)
        # Create and send an SMS message
        client.account.messages.create(
          :from => from,
          :to => mod_num(user.phone),
          :body => "Hi, #{user.name}, #{book.title} is due today."
        )
      end
    end
  end
end
