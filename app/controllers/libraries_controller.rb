class LibrariesController < BaseController
    protected
    def model_params
        params.require(:library).permit(:name, :url)
    end
    def related_fields
    end
    def model
        Library
    end
    def model_name
        'library'
    end
end
