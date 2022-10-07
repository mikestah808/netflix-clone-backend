class GenresController < ApplicationController
  # skip_before_action :authorized, only: :show
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  require 'pry'

  # GET /genres
  def index
    # binding.pry
    user = User.find_by(id: session[:user_id])
    genres = user.genres
    render json: genres
  end


  # def index
  #   # binding.pry
  #   genres = Genre.all
  #   render json: genres
  # end

  # GET /genres/id
  def show  
    genre = Genre.find_by(id: params[:id])
    render json: genre
  end

  # POST /genres
  def create
    binding.pry
      user = User.find_by(id: session[:user_id])
      genre = user.genres.find_or_create_by!(genre_params)
      render json: genre, status: :created
      rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
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

    def authorize
      return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end

end
