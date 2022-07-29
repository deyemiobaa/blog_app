class ApiController < ApplicationController
  attr_reader :current_user

  skip_before_action :verify_authenticity_token
  before_action :authenticate_token!

  private

  def authenticate_token!
    payload = JsonWebToken.decode(auth_token)
    if payload.present?
      @current_user = User.find_by(id: payload['user_id'])
    else
      render json: { errors: 'Invalid token' }, status: :unauthorized
    end
  rescue JWT::ExpiredSignature
    render json: { errors: 'Auth token has expired' }, status: :unauthorized
  rescue JWT::DecodeError
    render json: { errors: 'Invalid token' }, status: :unauthorized
  end

  def auth_token
    @auth_token ||= request.headers.fetch('Authorization', '').split.last
    # @auth_token
  end
end
