class BaseController < ApplicationController
  before_action :authenticate_request

  def authenticate_request
    if auth_token.blank?
      respond_to do |format|
        format.html { redirect_to authentication_url }
        format.json { render json: { error: 'Not Authenticated' }, status: :unauthorized }
      end
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
