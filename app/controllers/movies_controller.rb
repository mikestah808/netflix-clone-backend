class MoviesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  require 'pry'

  # GET /movies
  def index
    user = User.find_by(id: session[:user_id])
    movies = user.movies
    render json: movies
  end

  # POST /movies
  def create
    # binding.pry
    user = User.find_by(id: session[:user_id])
    movie = user.movies.create!(movie_params)
    render json: movie, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
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
      params.permit(:title, :description, :image_url, :release_date, :user_id, :genre_id)
    end

    def render_not_found_response
      render json: { error: "Movie not found" }, status: :not_found
    end

    def authorize
      return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end
    
end
