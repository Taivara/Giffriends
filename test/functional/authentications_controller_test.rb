require 'test_helper'

class AuthenticationsControllerTest < ActionController::TestCase

  setup do
    @authentication = create(:authentication)
    @user = @authentication.user
  end

  # Create should probably have a test...
  #test "should create authentication" do
  #end

  test "should destroy authentication" do
    sign_in @user

    assert_difference('Authentication.count', -1) do
      delete :destroy, id: @authentication
    end

    assert_redirected_to edit_user_registration_url
  end
end
