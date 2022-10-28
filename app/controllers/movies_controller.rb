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
    user = User.find_by(id: session[:user_id])
    movie = user.movies.find_by(id: params[:id])
    movie.update(movie_params)
    render json: movie
  end

  # DELETE /movies/1
  def destroy
    user = User.find_by(id: session[:user_id])
    movie = user.movies.find_by(id: params[:id])
    movie.destroy
    head :no_content
  end

  private
      # the purpose of using .find OVER .find_by is that the latter will return a value of nil, whereas .find will raise an Active Record exception.
      # this is important because we can rescue the exception with the code at the top of our movies controller, then have the render_not_found_response instance method return an error 
      # it's a good way to DRY up our code 

    # def find_movie
    #   Movie.find_by(id: params[:id])
    # end

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
