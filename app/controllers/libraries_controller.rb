class LibrariesController < BaseController
    protected
    def model_params
        params.require(:library).permit(:name, :url, :super_search_url)
    end
    def model
        Library
    end
    def model_name
        'library'
    end
end
