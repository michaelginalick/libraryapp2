class AdminController < ApplicationController
  skip_before_filter :verify_authenticity_token


  # as an admin
  # I want to be able to add a book
  # I want to be able to edit a book
  # I want to be able to delete a book
  # I want to be able to view all users checkouts
  # I want to be able to view the status of any book ie whose it checked out by, due date


  def index
    if session[:admin_id] != nil
      redirect_to admin_path(Admin.find(session[:admin_id]))
    else
      @admin = Admin.new
    end
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      session[:admin] = @admin.id
      redirect_to admin_path(@admin.id)
    else
      redirect_to root_url
    end
  end

  def show
    @search_book = Book.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
    @admin = Admin.find(session[:admin_id])
    @books = Book.all.length
    @current_checkouts = Book.where(checked_out?: true)
  end

  def update
    @book = Book.find(params[:id])
    @book.update(params[:book])
  end

  def delete
    @book = Book.find(params[:id])
    @book.destroy
  end

  def new
    @admin = Admin.new(admin_params)
  end

  def new_book
    @book = Book.create(params[:book])
  end

 






  private

  def admin_params
    params.require(:admin).permit(:email, :password)
  end

end
