class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def edit
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
