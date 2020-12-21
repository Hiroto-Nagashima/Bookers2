class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
  end
  def create
    flash[:notice] = "Welcome! You have signed up successfully."
  end

  private
  def user_params
    params.require(:book).permit(:title, :body)
  end

end
