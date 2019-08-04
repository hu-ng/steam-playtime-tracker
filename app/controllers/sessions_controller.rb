class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      flash[:success] = "You have logged in!"
      redirect_to root_url
    else
      flash[:danger] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    sign_out
    flash[:success] = "You have logged out!"
    redirect_to root_url
  end
end
