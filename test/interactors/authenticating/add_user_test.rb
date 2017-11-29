require 'test_helper'

class AddUserInteractorTest < ActiveSupport::TestCase

  test "new attendee" do
    assert_difference ->{ User.count } do
      result = Authenticating::AddUser.call(
        email: 'unique@email.com',
        password: 'foo',
        is_moderator: false
      )
      assert result.success?
      assert result.user.is_attendee?
    end
  end

  test "new moderator" do
    assert_difference ->{ User.count } do
      result = Authenticating::AddUser.call(
        email: 'unique@email.com',
        password: 'foo',
        is_moderator: true
      )
      assert result.success?
      assert result.user.is_moderator?
    end
  end

  test "existing email address" do
    assert_no_difference ->{ User.count } do
      @user = users(:attendee)
      result = Authenticating::AddUser.call(
        email: @user.email,
        password: 'doesntmatter'
      )
      assert_not result.success?
      assert_nil result.user
    end
  end

  test "empty email address" do
    assert_no_difference ->{ User.count } do
      @user = users(:attendee)
      result = Authenticating::AddUser.call(
        email: '',
        password: 'doesntmatter'
      )
      assert_not result.success?
      assert_nil result.user
    end
  end

  test "empty password" do
    assert_no_difference ->{ User.count } do
      @user = users(:attendee)
      result = Authenticating::AddUser.call(
        email: 'doesnt@matter.com',
        password: ''
      )
      assert_not result.success?
      assert_nil result.user
    end
  end
end
