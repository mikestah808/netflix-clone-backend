class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_unprocessable_entity


  # GET /users/1
  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  # POST /users
  def create
    user = User.create!(user_params)
    render json: user, status: :created
  end


  private
    
    # Strong params
    def user_params
      params.permit(:email, :password, :first_name, :last_name)
    end
  
    # Error handling
    def render_unprocessable_entity(invalid)
      render json: {error: invalid.record.errors}, status: :unprocessable_entity
    end


end
