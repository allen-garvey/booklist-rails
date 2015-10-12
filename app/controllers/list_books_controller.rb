class ListBooksController < BaseController
    protected
    def model_params
        params.require(:list_book).permit(:book_id, :list_id, :list)
    end
    def related_fields
        @books = Book.all
        @lists = List.all
    end
    def model
        ListBook
    end
    def model_name
        'list_book'
    end
    def model_title
        'List_Book'
    end
    def before_render_new
        @list_id = params[:list].to_i
        @book_id = params[:book].to_i
    end
    def redirect_after_model_created(model)
        redirect_to_caller
    end
    def redirect_after_destroy
        redirect_to_caller
    end
    def redirect_to_caller
        if params[:list] and params[:list].to_i > 0
            redirect_to url_for :controller => 'lists', :action => 'show', :id => params[:list].to_i
        elsif params[:book] and params[:book].to_i > 0
            redirect_to url_for :controller => 'books', :action => 'show', :id => params[:book].to_i
        end
    end
end
