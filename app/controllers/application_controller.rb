class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale



  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: User::USER_COLUMNS
    devise_parameter_sanitizer.permit :account_update, keys: User::USER_COLUMNS
  end

  private

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
