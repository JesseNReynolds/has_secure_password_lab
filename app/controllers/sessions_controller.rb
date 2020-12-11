class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to "/users"
        else
            @error = "Invalid username and/or password."
            redirect_to '/new'
        end

    end

    private

    def login_params
        params.require(:user).permit(:name, :password)
    end

end
