require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @attendee  = users(:attendee)
    @moderator = users(:moderator)
  end

  test "is_attendee" do
    assert     @attendee.is_attendee?
    assert_not @moderator.is_attendee?
  end

  test "is_moderator" do
    assert_not @attendee.is_moderator?
    assert     @moderator.is_moderator?
  end
end
