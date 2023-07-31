class UsersController < ApplicationController
    def new
    end

    def create
        user = User.new(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
            role: params[:role],
            password: params[:password],
            password_confirmation: params[:password_confirmation]
        )
        if user.save
            session[:user_id] = user.id
            flash[:success] = "Successfully create the User"
            redirect_to posts_path
        else
            flash[:warning] = "Invalid email or password"
            redirect_to '/signup'
        end
    end
end
