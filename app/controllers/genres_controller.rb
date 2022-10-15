class GenresController < ApplicationController
  # skip_before_action :authorized, only: :index, :destroy
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  require 'pry'

  # do i want to skip the instance method of authorize BEFORE a user is logged in? 
  # currently upon login, the index action doesn't run, therefore the genres array gets filled with ---> {error: 'Not authorized'} instead of ALL of the genres
  # THOUGHT PROCESS: maybe this is ok because anyone can have access to ALL gneres, but not everyone can have access to other users movies and users genres
  # CONCLUSION: It is alright to skip the authorize instance method so the genre index action can run properly 
  skip_before_action :authorized, only: [:index]

  # GET /genres
  # def index
  #   # binding.pry
  #   user = User.find_by(id: session[:user_id])
  #   genres = user.genres
  #   render json: genres
  # end


  def index
    # binding.pry
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

  def destroy
    genre = find_genre
    genre.destroy
    head :no_content
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
