class Api::BaseController < ApplicationController
  before_action :authenticate_request

  def authenticate_request
    if auth_token.blank?
      render json: { error: 'Not Authenticated' }, status: :unauthorized
    else
      @current_user = User.find(auth_token.to_i)
    end
  end

  def auth_token
    @auth_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end
end
