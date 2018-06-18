class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
    @orders = @book.orders
    @order = Order.new
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: "Book #{@book.title} has been created"
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      redirect_to edit_book_path(@book)
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :description, :number_of_copies)
    end
end
