class UsersController < ApplicationController
  require 'pry'
  skip_before_action :authorized, only: [:show]

  # rescue_from ActiveRecord::RecordNotFound, with: :render_unprocessable_entity


  # get current user
  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  # signup
  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private
    
    # Strong params
    def user_params
      params.permit(:first_name, :last_name, :email, :password)
    end
  
    # Error handling
    # def render_unprocessable_entity(invalid)
    #   render json: {error: invalid.record.errors}, status: :unprocessable_entity
    # end
end
