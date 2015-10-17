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
    def render_new
        set_caller_params
        super
    end
    def render_create_failed
        set_caller_params
        super
    end
    def set_caller_params
        @list_id = params[:list].to_i if params[:list].to_i > 0
        @book_id = params[:book].to_i if params[:book].to_i > 0
    end
    def caller_url
        if params[:list] and params[:list].to_i > 0
            url_for :controller => 'lists', :action => 'show', :id => params[:list].to_i
        elsif params[:book] and params[:book].to_i > 0
            url_for :controller => 'books', :action => 'show', :id => params[:book].to_i
        end
    end
    def flash_create_successful(model)
        flash[:success] = "#{model.book} added to #{model.list}"
    end
    def flash_delete_successful(model)
        flash[:info] = "#{model.book} removed from #{model.list}"
    end
end
