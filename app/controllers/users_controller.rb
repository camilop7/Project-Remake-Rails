class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle successful registration
      redirect_to root_path, notice: "Registration successful!"
    else
      # Handle registration failure
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
