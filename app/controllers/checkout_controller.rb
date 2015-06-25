require 'book_helper'
class CheckoutController < ApplicationController

  def show
    @user = User.find(session[:user_id])
    @book = Book.find(params[:id])
    @checkout = Checkout.create(:user_id => @user.id, :book_id => @book.id, :start_date => start_date, :due_date => due_date)
    if @checkout.save
      @book.update(checked_out?: true)
      respond_to do |format|
        format.html {redirect_to user_path(session[:user_id])}
      end
    else
      flash[:notice] = "Book was not checked out, please try again"
      redirect_to book_path(@book)
    end

  end


  private

  def checkout_params
    params.require(:checkout).permit(:user_id, :book_id, :start_date, :due_date)
  end

  def start_date
    t = Time.now
    checkout_date = t.strftime('%A %B %d %Y')
    return "Checkout date is: " + checkout_date
  end

  def due_date
    t = (Time.now + 60.days)
    checkin_date = t.strftime('%A %B %d %Y')
    return "The due date will be: " + checkin_date
  end


end
