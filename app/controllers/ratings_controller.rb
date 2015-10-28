class RatingsController < BaseController
    protected
    def model_params
        params.require(:rating).permit(:book_id, :post_rating)
    end
    def related_fields
        @books = Book.default_order
        if @books.empty?
            @related_fields_error = "Please add a book first"
        end
    end
    def model
        Rating
    end
    def model_name
        'rating'
    end
    def render_new
        set_caller_params
        super
    end
    def render_create_failed
        set_caller_params
        super
    end
    def set_caller_params
        @book_id = params[:book].to_i if params[:book].to_i > 0
    end
    def caller_url
        if params[:book] and params[:book].to_i > 0
            url_for :controller => 'books', :action => 'show', :id => params[:book].to_i
        end
    end
end
