class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


  # GET /users
  def index
    users = User.all
    render json: users
  end

  # GET /users/1
  def show
    user = find_user
    render json: user
  end

  # POST /users
  def create
    user = User.create(user_params)
    render json: user, status: :created
  end

  # PATCH/PUT /users/1
  def update
    user = find_user
    user.update(user_params)
    render json: user
  end

  # DELETE /users/1
  def destroy
    user = find_user
    user.destroy
    head :no_content
  end

  private
    # Only allow a list of trusted parameters through.
    def find_user 
      User.find(params[:id])
    end

    def user_params
      params.permit(:email, :password_digest, :first_name, :last_name)
    end

    def render_not_found_response
      render json: { error: "User not found" }, status: :not_found
    end
  
    # def render_unprocessable_entity(invalid)
    #   render json: {error: invalid.record.errors}, status: :unprocessable_entity
    # end


end
