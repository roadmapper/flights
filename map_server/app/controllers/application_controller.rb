# Needed for authentication
include ActionController::HttpAuthentication::Token::ControllerMethods
include ActionController::MimeResponds


# Inherits from ActionController::API instead of ActionController::Base
class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
end
