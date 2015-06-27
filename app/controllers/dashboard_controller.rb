class DashboardController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def admin
    @book = Book.new
  end

  def admin_add_book
    @book = Book.new(book_params)
    if @book.save
      respond_to do |format|
        format.html {redirect_to admin_index_path}
        format.json {render :json => @book}
      end
    else
      flash[:notice] = "Creation unsuccessful, please try again"
      redirect_to admin_add_book
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      respond_to do |format|
        format.html {redirect_to admin_index_path}
        format.json {render :json => @book}
      end
    else
      flash[:notice] = "Creation unsuccessful, please try again"
      redirect_to admin_add_book
    end
  end


  def admin_login
    @admin = get_admin(params[:admin])
    if @admin && @admin.authenticate(params[:admin][:password])
      session[:admin_id] = @admin.id
      redirect_to admin_path(@admin.id)
    else
      flash[:notice] = "Invalid username or password"
      redirect_to root_path
    end
  end

  def admin_logout
    session.clear
    flash[:notice] = "See you next time."
    redirect_to root_path
  end

  def admin_book_view
    @book = Book.find(params[:book_id])
  end

  def admin_book_update
    @book = Book.find(params[:book_id])
    @book.update(params[:book])

    redirect_to admin_path(Admin.find(session[:admin_id]))
  end

  def admin_book
    @checkout = Checkout.find(params[:checkout_id])
    book = @checkout.book_id
    user = @checkout.user_id
    @book = Book.find(book)
    @user = User.find(user)
  end

  def view_all
    @books = Book.all
  end


                          

  protected

  def get_admin(admin_params)
    Admin.find_by(email: admin_params[:email])
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre)
  end

end
