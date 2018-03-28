class BooksController < ApplicationController
  def index
    books = Book.all
    render json: books.as_json
  end

  def show
    book = Book.find(params[:id])
    render json: book.as_json
  end

  def create
    book = Book.new(title: params[:title], description: params[:description], pages: params[:pages])
    book.save
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    render json: {message: "I deleted the book ya wanted me to."}
  end

  def update
    book = Book.find(params[:id])
    book.update(title: params[:title], description: params[:description], pages: params[:pages])
    render json: book.as_json
  end
end
