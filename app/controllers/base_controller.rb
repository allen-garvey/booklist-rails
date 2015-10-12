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
        render_new
    end
    def create
        model = model().new(model_params)
        if model.save
            flash[:success] = "#{model} created"
            redirect_after_model_created model
        else
            related_fields
            set_view_model model
            @model_name = model_name
            render_create_failed
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
            flash[:info] = "#{@item} updated"
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
            flash[:info] = "#{@item} deleted"
            @item.destroy
        else
            flash[:danger] = "#{model_name.titleize} already deleted"
        end

        redirect_after_destroy
    end
    
    
    protected
    def set_view_model(data)
         instance_variable_set("@#{model_name}", data)
    end
    def view_model
        instance_variable_get "@#{model_name}"
    end
    #set up any params you want to do before new template is rendered and call super
    def render_new
        render :template => 'shared/new'
    end
    def render_create_failed
        render :template => 'shared/new'
    end
    #hook to redirect after model created
    def redirect_after_model_created(model)
        redirect_to model
    end
    #hook to redirect after model destroyed
    def redirect_after_destroy
        redirect_to url_for([model_name.pluralize])
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
