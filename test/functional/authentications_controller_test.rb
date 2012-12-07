require 'test_helper'

class AuthenticationsControllerTest < ActionController::TestCase

  setup do
    @authentication = create(:authentication)
    @user = @authentication.user
  end

  # Todo Add test for create method
  # test "should create authentication" do
  # end

  # Todo Add authorization tests for delete

  test 'should destroy authentication' do
    sign_in @user

    assert_difference('Authentication.count', -1) do
      delete :destroy, id: @authentication
    end

    assert_redirected_to edit_user_url(@user)
  end
end
