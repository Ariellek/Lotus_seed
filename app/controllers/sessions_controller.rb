class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email].downcase
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You are signed in!"
      redirect_to training_url
    else
      flash.now[:alert] = "Invalid Email/password."
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:notice] = "Thank you for visiting!"
    redirect_to root_url
  end
end
