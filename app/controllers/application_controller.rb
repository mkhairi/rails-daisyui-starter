# frozen_string_literal: true

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  layout :set_layout
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_layout
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username])
  end
end
