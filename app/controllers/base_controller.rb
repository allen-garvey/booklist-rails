class BaseController < ApplicationController
    def index
        @items = model().default_order
        @model = {name: model_title, items: @items}
        render template: 'shared/index'
    end
    def show
        prepare_for_show(model().find(params[:id]))
        render template: 'shared/show'
    end
    def new
        set_caller_params
        related_fields
        if defined? @related_fields_error
            flash[:danger] = @related_fields_error
            url = caller_url
            if url
                redirect_to url
            else
                index
            end
        else
            @model_name = model_name
            render_new
        end
    end
    def create
        model = model().new(model_params)
        if model.save
            flash_create_successful model
            redirect_after_model_created model
        else
            set_view_model model
            @model_name = model_name
            set_caller_params
            related_fields
            render_create_failed
        end
    end
    def edit
        @item = model().find(params[:id])
        @model_name = model_name #used for shared edit view
        set_view_model @item #used for local form_fields partial
        set_caller_params
        related_fields
        render_edit
    end
    
    def update
        @item = model().find(params[:id])
        if @item.update(model_params)
            flash_update_successful @item
            redirect_after_update(@item)
        else
            @model_name = model_name #used for shared edit view
            set_view_model @item #used for local form_fields partial
            set_caller_params
            related_fields
            redirect_after_update_failed
        end
    end
    def destroy
        @item = model().find_by(id: params[:id])
        if @item
            flash_delete_successful @item
            @item.destroy
        else
            flash_delete_failed
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
    #set flash messages
    def flash_create_successful(model)
        flash[:success] = "#{model} created"
    end
    def flash_update_successful(model)
        flash[:info] = "#{model} updated"
    end
    def flash_delete_successful(model)
        flash[:info] = "#{model} deleted"
    end
    def flash_delete_failed
        flash[:danger] = "#{model_name.titleize} already deleted"
    end
    #initialize any params here for redirect after form submitted
    def set_caller_params
    end
    def prepare_for_show(item)
        @item = item
        set_view_model @item
        @model_name = model_name
    end
    #set up any params you want to do before new template is rendered and call super
    def render_new
        render :template => 'shared/new'
    end
    def render_edit
        render :template => 'shared/edit'
    end
    def render_create_failed
        render :template => 'shared/new'
    end
    #hook to redirect after model created
    def redirect_after_model_created(model)
        url = caller_url
        if url
            redirect_to url
        else
            redirect_to model
        end
    end
    def redirect_after_update(model)
        url = caller_url
        if url
            redirect_to url
        else
            redirect_to model
        end
    end
    def redirect_after_update_failed
        render :template => 'shared/edit'
    end
    #hook to redirect after model destroyed
    def redirect_after_destroy
        url = caller_url
        if url
            redirect_to url
        else
            redirect_to url_for([model_name.pluralize])
        end
    end
    #hook to redirect to caller of create or destroy
    def caller_url
        nil
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
