require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @user = create(:user)
  end

  test 'should show user' do
    sign_in @user
    get :show, id: @user
    assert_response :success
  end

  test 'should get edit' do
    sign_in @user
    get :edit, id: @user
    assert_response :success
  end

  test 'should update user' do
    sign_in @user
    put :update, id: @user, user: {  }
    assert_redirected_to user_path(assigns(:user))
  end

  # Tests for unauthenticated users
  test 'should not get user index if not signed in' do
    get :index
    assert_redirected_to new_user_session_path
  end

  test 'should not get show user if not signed in' do
    get :show, id: @user
    assert_redirected_to new_user_session_path
  end

  test 'should not get user edit if not signed in' do
    get :edit, id: @user
    assert_redirected_to new_user_session_path
  end

  test 'should not update user if not signed in' do
    put :update, id: @user, user: {}
    assert_redirected_to new_user_session_path
  end

  # Tests for authorized users and admins
  test 'should not get user index if not an admin' do
    sign_in @user
    get :index
    assert_redirected_to new_user_session_path
  end

  test 'should get user index if user is an admin' do
    admin = create(:admin)
    sign_in admin
    get :index
    assert_response :success
  end

  test 'should not get show user for another user if not an admin' do
    user = create(:user)
    sign_in @user
    get :show, id: user
    assert_redirected_to new_user_session_path
  end

  test 'should get show user for another user if user is an admin' do
    admin = create(:admin)
    sign_in admin
    get :show, id: @user
    assert_response :success
  end

  test 'should not get user edit for another user if not an admin' do
    user = create(:user)
    sign_in @user
    get :edit, id: user
    assert_redirected_to new_user_session_path
  end

  test 'should get user edit for another user if user is an admin' do
    admin = create(:admin)
    sign_in admin
    get :edit, id: @user
    assert_response :success
  end

  test 'should not update another user if not an admin' do
    user = create(:user)
    sign_in @user
    put :update, id: user, user: {}
    assert_redirected_to new_user_session_path
  end

  test 'should update another user if user is an admin' do
    admin = create(:admin)
    sign_in admin
    put :update, id: @user, user: {}
    assert_redirected_to user_path(assigns(:user))
  end

end