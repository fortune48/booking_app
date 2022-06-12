class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    added_attrs = [:email, :first_name, :last_name, :gender, :role, :age, :password, :password_confirmation]

    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  private

  def after_sign_up_path_for(resource_or_scope)
    homes_index_path
  end
end
