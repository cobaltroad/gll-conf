class Authenticating::FindUser
  include Interactor

  def call
    context.user = User.find_by_email(context.email)
    unless context.user
      context.fail!(error: "Login error", message: "Cannot find email")
    end
  end
end
