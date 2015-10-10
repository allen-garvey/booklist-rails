class ClassificationsController < ApplicationController
	def index
		@classifications = Classification.all
        @model = {name: 'Classification', items: @classifications}
        render :template => 'shared/index'
    end
    def show
        @classification = Classification.find(params[:id])
    end
    def new

    end
    def create
        @classification = Classification.new(classification_params)
        if @classification.save
            redirect_to @classification
        else
            render 'new'
        end
    end
    def edit
         @classification = Classification.find(params[:id])
    end

    def update
        @classification = Classification.find(params[:id])

        if @classification.update(classification_params)
            redirect_to @classification
        else
            render 'edit'
        end
    end
    
    private
    def classification_params
        params.require(:classification).permit(:name)
    end
end
