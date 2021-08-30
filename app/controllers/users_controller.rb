class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :insure_current_user, only: [:edit]

  def index
    @users = User.all
    @user = current_user
    @book_new = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to user_path(@user.id)
    else
      render:edit
    end
  end

  private
  def insure_current_user
    @user = User.find(params[:id])
    unless @user == current_user
     redirect_to user_path(current_user.id)
    end
  end
  
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
