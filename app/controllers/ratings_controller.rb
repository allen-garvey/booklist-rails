class RatingsController < BaseController
    protected
    def model_params
        params.require(:rating).permit(:book_id, :post_rating)
    end
    def related_fields
        @books = Book.all
    end
    def model
        Rating
    end
    def model_name
        'rating'
    end
end
