class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /movies
  def index
    movies = Movie.all
    render json: movies
  end

  # GET /movies/1
  def show
    movie = find_movie
    render json: movie
  end

  # POST /movies
  def create
    movie = Movie.create(movie_params)
    render json: movie, status: :created
  end

  # PATCH/PUT /movies/1
  def update
    movie = find_movie
    movie.update(movie_params)
    render json: movie
  end

  # DELETE /movies/1
  def destroy
    movie = find_movie
    movie.destroy
    head :no_content
  end

  private

    def find_movie
      Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :genre, :description, :image_url, :release_date, :like, :dislike, :user_id, :genre_id, :user_id, :genre_id)
    end

    def render_not_found_response
      render json: { error: "Movie not found" }, status: :not_found
    end
end
