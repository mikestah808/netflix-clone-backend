class GenresController < ApplicationController
  before_action :set_genre, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /genres
  def index
    genres = Genre.all
    render json: genres
  end

  # GET /genres/1
  def show
    genre = find_genre
    render json: genre
  end

  # POST /genres
  def create
    genre = Genre.create(genre_params)
    render json: genre, status: :created
  end

  # PATCH/PUT /genres/1
  def update
    genre = find_genre
    genre.update(genre_params)
    render json: genre
  end

  # DELETE /genres/1
  def destroy
   genre = find_genre
   genre.destroy
   head :no_content
  end

  private
    
    def find_bird
      Genre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def genre_params
      params.require(:genre).permit(:action, :comedy, :drama, :horror, :romance, :thriller)
    end

    def render_not_found_response
      render json: { error: "Genre not found" }, status: :not_found
    end

end
