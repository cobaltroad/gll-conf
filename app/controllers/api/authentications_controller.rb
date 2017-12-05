class Api::AuthenticationsController < ApplicationController
  attr_reader :current_user

  def create
    i = Authenticating::AuthenticateUser.call(permitted_params)
    if i.success?
      render json: i.user, serializer: CurrentUserSerializer
    else
      render json: { message: 'Invalid email or password' }, status: i.status
    end
  end

  def add_user
    i = Authenticating::AddUser.call(permitted_params)
    if i.success?
      render json: i.user, serializer: CurrentUserSerializer, status: :created
    else
      render json: { message: i.message }, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.permit(:email, :password, :is_moderator)
  end
end
