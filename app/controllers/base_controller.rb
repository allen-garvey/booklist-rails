class BaseController < ApplicationController
    def index
        @items = model().all
        @model = {name: model_title, items: @items}
        render :template => 'shared/index'
    end
    def show
        set_view_model model().find(params[:id])
    end
    def new
        related_fields
        @model_name = model_name
        render :template => 'shared/new'
    end
    def edit
        set_view_model model().find(params[:id])
        related_fields
    end
    def create
        view_model = model().new(model_params)
        if view_model.save
            redirect_to view_model
        else
            related_fields
            render 'new'
        end
    end
    def update
        set_view_model model().find(params[:id])

        if view_model.update(model_params)
            redirect_to view_model
        else
            related_fields
            render 'edit'
        end
    end
    
    
    protected
    def set_view_model(data)
         instance_variable_set("@#{model_name}", data)
    end
    def view_model
        instance_variable_get "@#{model_name}"
    end
    #return class of model
    # def model
    # end

    # #name of model used to render index
    # #should be singular in title-case
    def model_title
        model_name.titleize
    end
    #used to name model passed into view
    def model_name
        ''
    end
    #params required to save or create
    # def model_params
    #     params.require(:book).permit(:title, :author_id, :pre_rating, :classification_id)
    # end
    #place calls to get models that are related to model e.g. Authors.all in books
    def related_fields
        
    end
end
