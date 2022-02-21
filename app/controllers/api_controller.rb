class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_post
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :invalid_post

  private

  def invalid_post(exception)
    render json: {errors: exception.message}, status: :unprocessable_entity
  end

  def not_found(exception)
    render json: {errors: exception.message}, status: :not_found
  end
end