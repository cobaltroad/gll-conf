class CurrentUserSerializer < ActiveModel::Serializer
  attributes \
    :id,
    :email,
    :role
end
