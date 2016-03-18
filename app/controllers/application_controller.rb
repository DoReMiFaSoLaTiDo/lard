class AccessDeniedError < StandardError
end
class NotAuthenticatedError < StandardError
end
class AuthenticationTimeoutError < StandardError
end


class ApplicationController < ActionController::Base
  # before_filter :authenticate_user!
  respond_to :json, :html
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :json_request?

  attr_reader :current_user

  def index
  end

  # When an error occurs, respond with the proper private method below
  rescue_from AuthenticationTimeoutError, with: :authentication_timeout
  rescue_from NotAuthenticatedError, with: :user_not_authenticated

  # if someone asks for html, redirect them to the home page, we only serve json
  def intercept_html_requests
    redirect_to('/') if request.format == Mime::HTML
  end

  protected

  def json_request?
    request.format.json?
  end

  # This method gets the current user based on the user_id included
  # in the Authorization header (json web token).
  #
  # Call this from child controllers in a before_action or from
  # within the action method itself
  def authenticate_request!
    fail NotAuthenticatedError unless user_id_included_in_auth_token?
    @current_user = User.find(decoded_auth_token[:user_id])
  rescue JWT::ExpiredSignature
    raise AuthenticationTimeoutError
  rescue JWT::VerificationError, JWT::DecodeError
    raise NotAuthenticatedError
  end

  private

  # Authentication Related Helper Methods
  # ------------------------------------------------------------
  def user_id_included_in_auth_token?
    http_auth_token && decoded_auth_token && decoded_auth_token[:user_id]
  end

  # Decode the authorization header token and return the payload
  def decoded_auth_token
    @decoded_auth_token ||= AuthToken.decode(http_auth_token)
  end

  # Raw Authorization Header token (json web token format)
  # JWT's are stored in the Authorization header using this format:
  # Bearer somerandomstring.encoded-payload.anotherrandomstring
  def http_auth_token
    @http_auth_token ||= if request.headers['Authorization'].present?
                           request.headers['Authorization'].split(' ').last
                         end
  end

  # Helper Methods for responding to errors
  # ------------------------------------------------------------
  def authentication_timeout
    render json: { errors: ['Authentication Timeout'] }, status: 419
  end
  def forbidden_resource
    render json: { errors: ['Not Authorized To Access Resource'] }, status: :forbidden
  end
  def user_not_authenticated
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end
end
