class GenresController < BaseController
    protected
    def model_params
        params.require(:genre).permit(:name)
    end
    def related_fields
    end
    def model
        Genre
    end
    def model_name
        'genre'
    end
end