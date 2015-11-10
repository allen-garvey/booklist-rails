class BooksController < BaseController
    protected
    def model_params
        params.require(:book).permit(:title, :author_id, :pre_rating, :classification_id, :genre_id, :active)
    end
    def related_fields
        @authors = Author.default_order
        @classifications = Classification.default_order
        @genres = Genre.default_order
    end
    def model
        Book
    end
    def model_name
        'book'
    end
end
