class BooksController < ApplicationController
    def index
        @books = Book.all
    end
    def show
        @book = Book.find(params[:id])
    end
    def new
        @authors = Author.all
    end
    def create
        @book = Book.new(book_params)
        @book.save
        redirect_to @book
    end

    private
    def book_params
        params.require(:book).permit(:title, :author_id)
    end
end
