require 'test_helper'

class AuthenticationsControllerTest < ActionDispatch::IntegrationTest
  test "valid email, valid password" do
    post api_authentication_url(email: "attendee@foo.com",
                            password: "goodpassword")
    assert_response :success
  end

  test "valid email, invalid password" do
    post api_authentication_url(email: "attendee@foo.com",
                            password: "badpassword")
    assert_response :unauthorized
  end

  test "invalid email" do
    post api_authentication_url(email: "doesnot@exist.com",
                            password: "doesntmatter")
    assert_response :not_found
  end

  test "adding a new attendee" do
    post add_user_api_authentication_url(email: "newattendee@foo.com",
                                     password: "newpassword",
                                     is_moderator: false)
    assert_response :created
  end

  test "adding a new moderator" do
    post add_user_api_authentication_url(email: "newattendee@foo.com",
                                     password: "newpassword",
                                     is_moderator: true)
    assert_response :created
  end

  test "adding an already used email" do
    post add_user_api_authentication_url(email: "attendee@foo.com",
                                     password: "newpassword",
                                     is_moderator: false)
    assert_response :unprocessable_entity
  end
end
