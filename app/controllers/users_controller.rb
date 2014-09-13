class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to links_path
      flash[:notice] = "Account created."
    else
      render "new"
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
