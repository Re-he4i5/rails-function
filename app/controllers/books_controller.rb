class BooksController < ApplicationController
  def index
    @books=Book.all
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      @books=Book.all
      render 'new'
    end
  end

  def show
    @book=Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :description, image: [])
  end
end
