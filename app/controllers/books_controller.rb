class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(bbok_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
  end

  def show
  end

  def destroy
  end
end
