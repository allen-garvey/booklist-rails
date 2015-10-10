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
        @authors = Author.all
        @classifications = Classification.all
    end
    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book
        else
            @authors = Author.all
            @classifications = Classification.all
            render 'new'
        end
    end
    def edit
         @book = Book.find(params[:id])
         @authors = Author.all
         @classifications = Classification.all
    end

    def update
        @book = Book.find(params[:id])

        if @book.update(book_params)
            redirect_to @book
        else
            @authors = Author.all
            @classifications = Classification.all
            render 'edit'
        end
    end
    
    private
    def book_params
        params.require(:book).permit(:title, :author_id, :pre_rating, :classification_id)
    end
end
