class Authenticating::AuthenticateUser
  include Interactor::Organizer

  organize Authenticating::FindUser,
           Authenticating::ValidatePassword
end
