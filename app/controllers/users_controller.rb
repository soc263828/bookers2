class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
  end
  
  def update
    @user = User.find(current_user.id)
    @user = update(user_params)
    redirect_to user_path(user.id)
  end 

  private
  
  def book_params
    params.require(:book).permit(:name, :introduction, :image)  end

end
