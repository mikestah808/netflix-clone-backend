class SessionsController < ApplicationController
    # skip_before_action :authorized, only: :created

    def index
        session[:session_hello] ||= "World"
        cookies[:cookies_hello] ||= "World"
        render json: { session: session, cookies: cookies.to_hash }
    end

    # look up a user in the database, verify their login credentials, and then store the authenticated user's id in the session:
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

    # clears the email out of the session
    # logout route
    def destroy
        session.delete :user_id
        head :no_content
    end

end
