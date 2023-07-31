class SessionsController < ApplicationController
  def home
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # Successful login, set the user_id in the session and redirect to the desired page
      session[:user_id] = user.id
      flash[:success] = 'Successfully Logged In!'
      redirect_to posts_path
    else
      # Invalid login, show error message
      flash.now[:alert] = 'Invalid email or password'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully Logged Out!'
    redirect_to root_path
  end
end

