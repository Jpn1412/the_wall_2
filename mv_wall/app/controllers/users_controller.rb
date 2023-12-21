class UsersController < ApplicationController
  def login
  end

  def login_user
    user = User.fetch_user(login_params[:email])

    if user && User.authenticate_password(user['password'], login_params[:password])
      session[:user] = user
      redirect_to '/blog'
    else
      flash[:notice] = 'User not found/Wrong Password'
      redirect_to '/login'
    end
  end

  def registration
  end

  def save_user
    validations = User.validate_registration(registration_params)

    if validations.empty?
      user = User.save_user(registration_params)
      flash[:notice] = 'New user added' if user.present?
      redirect_to '/login'
    else
      flash[:notice] = validations.join(', ')
      redirect_to '/registration'
    end
  end

  private

  def registration_params
    params.require(:register).permit(:first_name, :last_name, :email, :password, :confirm_password)
  end

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
