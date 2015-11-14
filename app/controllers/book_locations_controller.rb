class BookLocationsController < BaseController
    protected
    def model_params
        params.require(:book_location).permit(:book_id, :location_id, :call_number)
    end
    def related_fields
        @books = Book.default_order
        @locations = Location.default_order
        @libraries = Library.default_order #required for opt-groups on form fields
        if defined? @location_id
            @books = @books - Book.joins(:book_locations).where("book_locations.location_id = ?", @location_id)
        end
        if defined? @book_id
            @locations = @locations - Location.joins(:book_locations).where("book_locations.book_id = ?", @book_id)
        end
        if @books.empty? and @locations.empty?
            @related_fields_error = "Please add a book and location first"
        elsif @books.empty?
            @related_fields_error = "Please add a book first"
        elsif @locations.empty?
            @related_fields_error = "Please add a location first"
        end
    end
    def model
        BookLocation
    end
    def model_name
        'book_location'
    end
    def model_title
        'Book_Location'
    end
    def set_caller_params
        @location_id = params[:location].to_i if params[:location].to_i > 0
        @library_id = params[:library].to_i if params[:library].to_i > 0
        @book_id = params[:book].to_i if params[:book].to_i > 0
    end
    def caller_url
        if params[:library] and params[:library].to_i > 0
            url_for :controller => 'libraries', :action => 'show', :id => params[:library].to_i
        elsif params[:location] and params[:location].to_i > 0
            url_for :controller => 'locations', :action => 'show', :id => params[:location].to_i
        elsif params[:book] and params[:book].to_i > 0
            url_for :controller => 'books', :action => 'show', :id => params[:book].to_i
        end
    end
    def flash_create_successful(model)
        flash[:success] = "#{model.book} added to #{model.location}"
    end
    def flash_delete_successful(model)
        flash[:info] = "#{model.book} removed from #{model.location}"
    end
end