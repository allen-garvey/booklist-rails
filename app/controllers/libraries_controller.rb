class LibrariesController < BaseController
    #route to display books on bookshelf
    def bookshelf
        bookshelf = Library.find_by name: Library.bookshelf_name
        if bookshelf
            prepare_for_show(bookshelf)
            render 'shared/show'
        else
            index
        end
    end
    protected
    def model_params
        params.require(:library).permit(:name, :url)
    end
    def model
        Library
    end
    def model_name
        'library'
    end
end
