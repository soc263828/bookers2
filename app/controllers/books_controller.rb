class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
     unless @book.user_id == current_user.id
      redirect_to books_path(@book.id)
     end
  end

  def create
     @books = Book.all
    @user = User.find(current_user.id)
     @book = Book.new(book_params)
     @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
