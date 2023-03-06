class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:create]


    # login route 
    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        else
            render json: { error: { login: "Invalid email or password" }}, status: :unauthorized
        end
    end

    # logout route
    def destroy
        session.delete :user_id
        head :no_content
    end


end
