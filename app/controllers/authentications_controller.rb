class AuthenticationsController < ApplicationController
  attr_reader :current_user

  def show
    respond_to do |format|
      format.html
    end
  end

  def create
    i = Authenticating::AuthenticateUser.call(permitted_params)
    if i.success?
      render json: { current_user_id: i.user.id }
    else
      render json: { error: 'Not Authenticated' }, status: i.status
    end
  end

  private

  def permitted_params
    params.permit(:email, :password)
  end
end
