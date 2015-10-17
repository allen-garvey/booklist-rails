class LocationsController < BaseController
    protected
    def model_params
        params.require(:location).permit(:name, :library_id)
    end
    def related_fields
    	@libraries = Library.all
    end
    def model
        Location
    end
    def model_name
        'location'
    end
end
