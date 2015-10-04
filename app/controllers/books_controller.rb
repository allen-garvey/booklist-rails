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
    def edit
         @book = Book.find(params[:id])
         @authors = Author.all
    end

    def update
        @book = Book.find(params[:id])

        if @book.update(book_params)
            redirect_to @book
        else
            render 'edit'
        end
    end
    
    private
    def book_params
        params.require(:book).permit(:title, :author_id)
    end
end
