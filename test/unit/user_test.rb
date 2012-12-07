require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'should be a valid user with all proper fields' do
    user = build(:user)
    assert user.valid?, 'Is not a valid user'
  end

  test 'should not be valid without email' do
    user = build(:user, email: nil)
    assert !user.valid?, 'User is valid without email'
  end

  test 'admin? should return true if user is an admin' do
    user = create(:admin)
    assert user.admin?, 'Is not an admin'
  end

  test 'admin? should return false if user is not an admin' do
    user = create(:user)
    assert !user.admin?, 'is an admin'
  end

  test 'should delete roles when user record is deleted' do
    admin = create(:admin)
    assert_difference('Role.count', -1) do
      admin.destroy
    end
  end

  test 'should delete authentications when user record is deleted' do
    authentication = create(:authentication)
    user = authentication.user
    assert_difference('Authentication.count', -1) do
      user.destroy
    end
  end
end
