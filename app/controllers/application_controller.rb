class ApplicationController < ActionController::Base
  before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # Strong params para crear un usuario, no requerido, no tendra esta feature
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # Strong params para editar un usuario, tampoco tendrá esta feature
    # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
