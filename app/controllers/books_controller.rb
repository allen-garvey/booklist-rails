class BooksController < ApplicationController
    def index
        @books = Book.all
        @model = {name: 'Book', items: @books}
        render :template => 'shared/index'
    end
    def show
        @book = Book.find(params[:id])
    end
    def new
        related_fields
    end
    def edit
        @book = Book.find(params[:id])
        related_fields
    end
    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book
        else
            related_fields
            render 'new'
        end
    end
    def update
        @book = Book.find(params[:id])

        if @book.update(book_params)
            redirect_to @book
        else
            related_fields
            render 'edit'
        end
    end
    
    private
    def book_params
        params.require(:book).permit(:title, :author_id, :pre_rating, :classification_id)
    end
    def related_fields
        @authors = Author.all
        @classifications = Classification.all
    end
end
