class RegistrationsController < Devise::RegistrationsController

  # This controller overrides the default devise registration controller
  # with our authentication logic.

  def create
    # Remove omniauth data from session after successful registration
    super
    session[:omniauth] = nil unless @user.new_record?
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
