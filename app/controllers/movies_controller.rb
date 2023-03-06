class MoviesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  require 'pry'
  skip_before_action :authorized

  def index
    user = User.find_by(id: session[:user_id])
    movies = user.movies
    render json: movies
  end

 
  def create
    user = User.find_by(id: session[:user_id])
    movie = user.movies.create!(movie_params)
    render json: movie, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    user = User.find_by(id: session[:user_id])
    movie = user.movies.find_by(id: params[:id])
    movie.update(movie_params)
    render json: movie
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    movie = user.movies.find_by(id: params[:id])
    movie.destroy
    head :no_content
  end

  private

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
