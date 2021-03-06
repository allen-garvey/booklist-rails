class BooksController < BaseController
    def bookshelf
        @books = Book.bookshelf_books
        if @books
            render 'bookshelf'
        else
            index
        end
    end
    protected
    def model_params
        params.require(:book).permit(:title, :author_id, :pre_rating, :classification_id, :genre_id, :active, :release_date, :on_bookshelf, :subtitle)
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
        books = super
        if params[:active] and params[:active] == 'true'
            books = books.where(active: true)
        elsif params[:active] and params[:active] == 'false'
            books = books.where(active: false)
        end
        if params[:location] and params[:location] == 'false'
            books = books.where.not(id: BookLocation.select(:book_id))
        elsif params[:location] and params[:location] == 'false'
            books = books.where(id: BookLocation.select(:book_id))
        end
        books
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
    def show_super_search_links_on_index
        true
    end
end
