require 'test_helper'

class AuthenticationsControllerTest < ActionDispatch::IntegrationTest
  test "valid email, valid password" do
    post authentication_url(email: "attendee@foo.com",
                            password: "goodpassword")
    assert_response :success
  end

  test "valid email, invalid password" do
    post authentication_url(email: "attendee@foo.com",
                            password: "badpassword")
    assert_response :unauthorized
  end

  test "invalid email" do
    post authentication_url(email: "doesnot@exist.com",
                            password: "doesntmatter")
    assert_response :not_found
  end
end