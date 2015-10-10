class BaseController < ApplicationController
    def index
        @items = model().all
        @model = {name: model_title, items: @items}
        render :template => 'shared/index'
    end
    def show
        @item = model().find(params[:id])
        set_view_model @item
        @model_name = model_name
    end
    def new
        related_fields
        @model_name = model_name
        before_render_new
        render :template => 'shared/new'
    end
    def create
        model = model().new(model_params)
        if model.save
            redirect_to model
        else
            related_fields
            set_view_model model
            @model_name = model_name
            render :template => 'shared/new'
        end
    end
    def edit
        @item = model().find(params[:id])
        related_fields
        @model_name = model_name #used for shared edit view
        set_view_model @item #used for local form_fields partial
        render :template => 'shared/edit'
    end
    
    def update
        @item = model().find(params[:id])
        if @item.update(model_params)
            redirect_to @item
        else
            related_fields
            @model_name = model_name #used for shared edit view
            set_view_model @item #used for local form_fields partial
            render :template => 'shared/edit'
        end
    end
    def destroy
        @item = model().find_by(id: params[:id])
        if @item
            flash[:info] = "#{@item.to_s} deleted"
            @item.destroy
        else
            flash[:danger] = "#{model_name.titleize} already deleted"
        end
 
        redirect_to url_for([model_name.pluralize])
    end
    
    
    protected
    def set_view_model(data)
         instance_variable_set("@#{model_name}", data)
    end
    def view_model
        instance_variable_get "@#{model_name}"
    end
    #set up any params you want to do before new template is rendered
    def before_render_new
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
