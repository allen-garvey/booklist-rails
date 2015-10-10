class BooksController < BaseController
    protected
    def model_params
        params.require(:book).permit(:title, :author_id, :pre_rating, :classification_id)
    end
    def related_fields
        @authors = Author.all
        @classifications = Classification.all
    end
    def model
        Book
    end
    def model_name
        'book'
    end
end
