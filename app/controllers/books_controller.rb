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
    @book_new = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
     unless book.id == current_user.id
    redirect_to :show
  end
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @user = current_user
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else
      render :show
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(book.id)
    else
      render :show
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
