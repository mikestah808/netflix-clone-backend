class GenresController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :authorize


  # GET /genres
  def index
    genres = Genre.all
    render json: genres
  end
  # GET /genres/id
  def show  
    genre = Genre.find_by(id: params[:id])
    render json: genre
  end

  # POST /genres
  def create
      genre = Genre.find_or_create_by!(genre_params)
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
