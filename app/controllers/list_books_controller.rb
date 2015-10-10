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
        @list_id = params[:list]
    end
end
