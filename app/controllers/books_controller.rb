class BooksController < BaseController
    #route to display books on bookshelf
    def bookshelf
        bookshelf = Library.find_by name: Book.bookshelf_title
        if bookshelf
            redirect_to bookshelf
        else
            redirect_to url_for(controller: :libraries, action: :index)
        end
    end
    protected
    def model_params
        params.require(:book).permit(:title, :author_id, :pre_rating, :classification_id, :genre_id)
    end
    def related_fields
        @authors = Author.all
        @classifications = Classification.all
        @genres = Genre.all
    end
    def model
        Book
    end
    def model_name
        'book'
    end
end
