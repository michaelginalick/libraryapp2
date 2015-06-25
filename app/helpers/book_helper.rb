module BookHelper

  def start_date
    t = Time.now
    checkout_date = t.strftime('%A %B %d %Y')
    return "Checkout date is: " + checkout_date
  end

  def due_date
    t = (Time.now + 60.days)
    checkin_date = t.strftime('%A %B %d %Y')
    return "The due date is: " + checkin_date
  end


  def show_dates
    if @book.checked_out? == true
      if @user_checkouts.length > 0
        return due_date
      else
        return "This book is currently checked out"
      end
    else
      return start_date + " " + due_date
    end
  end



  def good_reads_data(book)
    client = Goodreads.new(api_key: 'dLe4w6mTCE44oYBGPDNg')
    @search = client.book(book)

    rating
    formatted_string
  end

  def formatted_string
    edit = @search.description.gsub(/(&amp)/, '')
    return edit
  end

  def rating
    return  @search.average_rating
  end

end
