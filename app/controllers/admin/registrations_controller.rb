class Admin::RegistrationsController < ApplicationController
  layout 'signup'

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = true
    if @user.save
      session[:user_id] = @user.id
      redirect_to admin_questions_path, notice: "Admin successfully created and logged in!"
    else
      render :new
    end
  end

  protected
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
