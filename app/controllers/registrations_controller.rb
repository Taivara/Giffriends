class RegistrationsController < Devise::RegistrationsController

  def create
    # Remove omniauth data from session after successful registration
    super
    session[:omniauth] = nil unless @user.new_record?
  end

  def update
    @user = User.find(current_user.id)
    email_changed = @user.email != params[:user][:email]
    password_changed = !params[:user][:password].empty?

    successfully_updated = if email_changed or password_changed
      @user.update_with_password(params[:user])
    else
      @user.update_without_password(params[:user])
    end

    if successfully_updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, bypass: true
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  # Override the devise build method for users using omniauth
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end
end
