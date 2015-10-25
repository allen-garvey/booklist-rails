class ClassificationsController < BaseController
    protected
    def model_params
        params.require(:classification).permit(:name)
    end
    def model
        Classification
    end
    def model_name
        'classification'
    end
end
