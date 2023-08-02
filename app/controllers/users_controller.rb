class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
     user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to current_user_path
  end
  end

  def index
  end

  def update
    @user = User.find(current_user.id)
    @user = update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully.。"
       redirect_to user_path(@user.id)
    else
      render :new
    end
    redirect_to user_path(user.id)
  end

  private

  def book_params
    params.require(:book).permit(:name, :introduction, :image)  end

end
