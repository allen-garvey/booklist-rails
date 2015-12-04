class LibraryItemsController < BaseController
	protected
    def model_params
        params.require(:library_item).permit(:library_id, :due_date, :items)
    end
    def related_fields(method)
        @libraries = Library.default_order
        if @libraries.empty?
            @related_fields_error = "Please add a library first"
        end
    end
	def model
        LibraryItem
    end
    def model_name
        'library_item'
    end
    def model_title
        'Library_Item'
    end
end
