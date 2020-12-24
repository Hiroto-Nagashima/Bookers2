class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new= Book.new
    
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    
    if @book.save
      flash[:notice] ="You have created book successfully"
      redirect_to book_path(@book.id)
    else
      render "show"
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.user_id = current_user.id
    book.destroy
    redirect_to user_path(params[:id])
  end

  def edit
    @Book= Book.find(params[:id])
  end

  def update
    if @book.update
      flash[:notice] ="You have updated book successfully"
      redirect_to user_path(current_user.id)
    else
      render "edit"
    end
  end

  private
    def book_params
     params.require(:book).permit(:title, :body)
    end
end
