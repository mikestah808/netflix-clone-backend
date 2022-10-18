class GenresController < ApplicationController
  # skip_before_action :authorized, only: :index, :destroy
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  require 'pry'

  # do i want to skip the instance method of authorize BEFORE a user is logged in? 
  # currently upon login, the index action doesn't run, therefore the genres array gets filled with ---> {error: 'Not authorized'} instead of ALL of the genres
  # THOUGHT PROCESS: maybe this is ok because anyone can have access to ALL gneres, but not everyone can have access to other users movies and users genres
  # CONCLUSION: It is alright to skip the authorize instance method so the genre index action can run properly 
  skip_before_action :authorized, only: [:index]


  def index
    # binding.pry
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


  private

    # Only allow a list of trusted parameters through.
    def genre_params
      params.permit(:name)
    end

    def render_not_found_response
      render json: { error: "Genre not found" }, status: :not_found
    end

end
