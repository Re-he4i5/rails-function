class BooksController < ApplicationController
  def index
    key_word = params[:keyword]
    @books = Book.search(key_word)
    @book = Book.new

  end

  def show
    @book = Book.find params[:id]
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      @books = Book.all
      render :index
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
