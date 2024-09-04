# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  self.responder = ApplicationResponder
  respond_to :html
  layout :set_layout
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_layout
    if devise_controller?
      "devise"
    else
      "admin"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password password_confirmation])
  end
end
