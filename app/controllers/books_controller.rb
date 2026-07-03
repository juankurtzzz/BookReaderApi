class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]

  # GET /books
  def index
    @books = Book.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_content
    end
  end

  def search
    @books = Book.where("title LIKE ?", "%#{params[:query]}%")
    render json: @books
  end

  def categories 
    @categories = Book.all
    render json: @categories
  end

  def authors
    @author = Book.all
    render json: @author
  end 

  def category_by_id
    @categories = Book.find_by(id: params[:id], category: params[:category])
    render json: @categories
  end

  def author_by_id
    @author = Book.find_by(id: params[:id], author: params[:author])
    render json: @author
  end

  def long_books
    @long_books = Book.where("pages > ?", 300)
    render json: @long_books
  end

  def short_books
    @short_books = Book.where("pages < ?", 100)
    render json: @short_books
  end

  # DELETE /books/1
  def destroy
    @book.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.expect(book: [ :title, :description, :author, :pages, :category ])
    end
end
