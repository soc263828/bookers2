class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  end

  def index
  end

  private
  def book_params
    params.require(:book).permit(:name, :introduction, :image)  end

end
