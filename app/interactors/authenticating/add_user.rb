class Authenticating::AddUser
  include Interactor

  before do
    @role = context.is_moderator ? User::MODERATOR_STRING : User::ATTENDEE_STRING
  end

  def call
    password_salt = SecureRandom.base64(15)
    encrypted_password = Digest::SHA2.new(512).update(context.password + password_salt)

    user = User.new(
      email: context.email,
      encrypted_password: encrypted_password,
      password_salt: password_salt,
      role: @role
    )
    if user.save
      context.user = user
    else
      context.fail!(message: user.errors.full_messages.join('; '))
    end
  end
end
