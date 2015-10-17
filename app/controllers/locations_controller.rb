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
    def render_new
        set_caller_params
        super
    end
    def render_create_failed
        set_caller_params
        super
    end
    def set_caller_params
        @library_id = params[:library].to_i if params[:library].to_i > 0
    end
    def redirect_after_model_created(model)
        url = caller_url
        if url
            redirect_to url
        else
            super
        end
    end
    def redirect_after_destroy
        url = caller_url
        if url
            redirect_to url
        else
            super
        end
    end
    def caller_url
        if params[:library] and params[:library].to_i > 0
            url_for :controller => 'libraries', :action => 'show', :id => params[:library].to_i
        end
    end
end
