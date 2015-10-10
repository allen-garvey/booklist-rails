class ListBookController < BaseController
    protected
    def model_params
        params.require(:list).permit(:book_id, :list_id)
    end
    def related_fields
    end
    def model
        ListBook
    end
    def model_name
        'listbook'
    end
end
