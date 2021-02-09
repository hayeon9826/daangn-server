class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale


  layout :detect_layout

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def detect_layout
    if controller_name == "home" and action_name == "web"
      'web_layout'
    else
      'application'
    end
  end

  def configure_permitted_parameters
    # added_attrs = %i{name thumbnail address1 address2 zipcode phone gender accept_sms accept_email}
    devise_parameter_sanitizer.permit :sign_up, keys: User::USER_COLUMNS
    devise_parameter_sanitizer.permit :account_update, keys: User::USER_COLUMNS
  end

  private

  def after_sign_out_path_for(resource)
    # new_user_session_path
    root_path
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
