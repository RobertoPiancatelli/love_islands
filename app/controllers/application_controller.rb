class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # line below required! calls permitted parameters!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name photo])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username photo])
  end

  def default_url_options
    { host: ENV["https://love-islands.herokuapp.com"] || "localhost:3000" }
  end
end
