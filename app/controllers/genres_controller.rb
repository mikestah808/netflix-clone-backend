class GenresController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /genres
  def index
    genres = Genre.all
    render json: genres
  end

  # POST /genres
  def create
    genre = Genre.find_or_create_by!(genre_params)
    render json: genre, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  # PATCH/PUT /genres/1
  def update
    genre = find_genre
    genre.update(genre_params)
    render json: genre
  end

  private
    
    def find_genre
      Genre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def genre_params
      params.permit(:name)
    end

    def render_not_found_response
      render json: { error: "Genre not found" }, status: :not_found
    end

end
