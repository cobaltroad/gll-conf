require 'test_helper'

class ValidatePasswordInteractorTest < ActiveSupport::TestCase
  def setup
    @attendee = users(:attendee)
  end

  test "valid password" do
    result = Authenticating::ValidatePassword.call(user: @attendee,
                                                   password: "goodpassword")
    assert result.success?
  end

  test "bad password" do
    result = Authenticating::ValidatePassword.call(user: @attendee,
                                                   password: "badpassword")
    assert_not result.success?
  end
end
