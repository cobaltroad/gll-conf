require 'test_helper'

class FindUserInteractorTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: "foo@bar.com")
  end

  test "user exists" do
    result = Authenticating::FindUser.call(email: @user.email)
    assert result.success?
    assert @user, result.user
  end

  test "user does not exist" do
    result = Authenticating::FindUser.call(email: "doesnot@exist.com")
    assert_not result.success?
    assert_nil result.user
  end
end
