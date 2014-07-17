# Needed for authentication
include ActionController::HttpAuthentication::Token::ControllerMethods
include ActionController::MimeResponds


# Inherits from ActionController::API instead of ActionController::Base
class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  before_filter :restrict_access
  def restrict_access
    api_key = ApiKey.where(access_token: params[:access_token])
    render json: {message: "Unauthorized"}, status: 401 unless api_key
  end
  def authenticate
  	authenticate_or_request_with_http_token do |token, options|
    	apiKey = ApiKey.where(access_token: token).first
    	@current_user = apiKey.token if apiKey
  end
end 
end
