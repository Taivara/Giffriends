require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  # Test layout

  test 'notice element displays when set' do
    get :index, {}, {}, { notice: 'Some notice' }
    assert_select '.notice', 'Some notice'
  end

  test 'notice element not displayed when not' do
    get :index
    assert_select '.notice', 0
  end

  test 'alert element displays when set' do
    get :index, {}, {}, { alert: 'Some alert' }
    assert_select '.alert', 'Some alert'
  end

  test 'alert element not displayed when not' do
    get :index
    assert_select '.alert', 0
  end

  test 'proper links appear when signed out' do
    get :index
    assert_select "a[href=#{new_user_registration_path}]", 1
    assert_select "a[href=#{new_user_session_path}]", 1
    assert_select "a[href=#{edit_user_registration_path}]", 0
    assert_select "a[href=#{destroy_user_session_path}]", 0
    assert_select 'nav strong', 0
  end

  test 'proper links appear when signed in' do
    sign_in user = create(:user)
    get :index
    assert_select "a[href=#{new_user_registration_path}]", 0
    assert_select "a[href=#{new_user_session_path}]", 0
    assert_select "a[href=#{edit_user_registration_path}]", 1
    assert_select "a[href=#{destroy_user_session_path}]", 1
    assert_select 'nav strong', user.email
  end

end