class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from ::NameError, with: :error_occurred
  rescue_from ::ActiveRecord::ActiveRecordError, with: :error_occurred
  rescue_from ::ActionController::RoutingError, with: :error_occurred
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
  
  def error_occurred(exception)
    logger.error "Error occurred: #{exception}"
    logger.error "Params: #{params}"

    render json: {error: exception.message}.to_json, status: 500
    return
  end
end
