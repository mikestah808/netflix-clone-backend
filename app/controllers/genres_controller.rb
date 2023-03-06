class GenresController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  require 'pry'

  skip_before_action :authorized


  def index
    genres = Genre.all
    render json: genres
  end

  
  def create
      genre = Genre.find_or_create_by!(genre_params)
      render json: genre, status: :created
      rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end


  private

    def genre_params
      params.permit(:name)
    end

    def render_not_found_response
      render json: { error: "Genre not found" }, status: :not_found
    end

end
