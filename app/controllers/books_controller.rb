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
    @books = Book.all
    @book = Book.new(book_params)
    @user = current_user
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ="You have created book successfully"
      redirect_to book_path(@book.id)
    else
      render "index"
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.user_id = current_user.id
    book.destroy
    redirect_to books_path
  end

  def edit
    @book= Book.find(params[:id])
  end

  def update
    @book= Book.find(params[:id])
    if @book.update(book_params)
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
