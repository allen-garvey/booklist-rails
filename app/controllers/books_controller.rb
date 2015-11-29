class BooksController < BaseController
    protected
    def model_params
        params.require(:book).permit(:title, :author_id, :pre_rating, :classification_id, :genre_id, :active, :release_date)
    end
    def related_fields(method)
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
    def index_model
        if params[:active] and params[:active] == 'true'
            Book.active_ordered true
        elsif params[:active] and params[:active] == 'false'
            Book.active_ordered false
        else
            super
        end
    end
    def set_index_session_params
        if params[:active] and params[:active] == 'true'
            session[:index_link_params] = {active: true}
        elsif params[:active] and params[:active] == 'false'
            session[:index_link_params] = {active: false}
        else
            session[:index_link_params] = nil
        end
    end
end
