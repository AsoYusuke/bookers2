class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user,only: [:edit,:update,:destroy]

  def new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.new
    @bookdetail = Book.find(params[:id])
    @user = @bookdetail.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:profile_image, :title, :body)
  end
  
  def ensure_correct_user
      @book = Book.find(params[:id])
      if @book.user_id != current_user.id
      	redirect_to books_path
      end
  end

end
