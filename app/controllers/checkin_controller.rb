class CheckinController < ApplicationController

  def show
    @user = User.find(session[:user_id])
    @book = Book.find(params[:id])
    @checkin = Checkin.create(:user_id => @user.id, :book_id => @book.id, :checkin_date => checkin_date)
    if @checkin.save
      @book.update(checked_out?: false)
      respond_to do |format|
        format.html {redirect_to user_path(session[:user_id])}
        flash[:notice] = "Thanks!"
      end
    else
      flash[:notice] = "Book was not checked out, please try again"
      redirect_to book_path(@book)
    end
  end



  private

  def checkin_date
    t = Time.now
    checkin_date = t.strftime('%A %B %d %Y')
  end

end
