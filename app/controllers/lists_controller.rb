class ListsController < BaseController
    protected
    def model_params
        params.require(:list).permit(:name)
    end
    def model
        List
    end
    def model_name
        'list'
    end
end