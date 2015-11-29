class ListBooksController < BaseController
    protected
    def model_params
        params.require(:list_book).permit(:book_id, :list_id, :list)
    end
    def related_fields(method)
        @books = Book.default_order
        @lists = List.default_order
        if method == 'new' or method == 'create'
            if defined? @list_id
                @books = @books - Book.joins(:list_books).where('list_books.list_id = ?', @list_id)
            end
            if defined? @book_id
                @lists = @lists - List.joins(:list_books).where("list_books.book_id = ?", @book_id)
            end
        end
        if @books.empty? and @lists.empty?
            @related_fields_error = "Please add a book and create a list first"
        elsif @books.empty?
            @related_fields_error = "Please add a book first"
        elsif @lists.empty?
            @related_fields_error = "Please create a list first"
        end
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
