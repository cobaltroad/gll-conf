class Authenticating::ValidatePassword
  include Interactor

  def call
    encrypted_password = context.user.encrypted_password
    password_salt = context.user.password_salt

    encrypted_input = Digest::SHA2.new(512).update(context.password + password_salt)
    if encrypted_input.to_s != encrypted_password
      context.fail!(error: "Login error",
                    message: "Invalid password",
                    status: :unauthorized)
    end
  end
end
