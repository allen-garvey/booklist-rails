class AuthorsController < BaseController
    protected
    def model_params
        params.require(:author).permit(:first, :middle, :last)
    end
    def model
        Author
    end
    def model_name
        'author'
    end
end