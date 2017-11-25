require 'test_helper'

class FindUserInteractorTest < ActiveSupport::TestCase
  def setup
    @attendee  = users(:attendee)
    @moderator = users(:moderator)
  end

  test "attendee exists" do
    result = Authenticating::FindUser.call(email: @attendee.email)
    assert result.success?
    assert_equal @attendee, result.user
  end

  test "moderator exists" do
    result = Authenticating::FindUser.call(email: @moderator.email)
    assert result.success?
    assert_equal @moderator, result.user
  end

  test "user does not exist" do
    result = Authenticating::FindUser.call(email: "doesnot@exist.com")
    assert_not result.success?
    assert_nil result.user
  end
end
