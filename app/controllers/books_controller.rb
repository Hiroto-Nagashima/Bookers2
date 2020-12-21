class BooksController < ApplicationController

  def index

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] ="Book was successfully created."

    else
      render "show"
    end

  end

  def destroy
  end

  def edit
  end

  def new
  end
  def show
  end

  private
    def book_params
     params.permit(:title, :body)
    end
end
