class ApplicationController < ActionController::API
  rescue_from ::NameError, with: :error_occurred
  rescue_from ::ActiveRecord::ActiveRecordError, with: :error_occurred
  rescue_from ::ActionController::RoutingError, with: :error_occurred

  protected
  def error_occurred(exception)
    logger.error "Error occurred: #{exception}"
    logger.error "Params: #{params}"

    render json: {error: exception.message}.to_json, status: 500
    return
  end
end
