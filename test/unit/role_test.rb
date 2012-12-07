require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test 'should be a valid role with all proper fields' do
    role = build(:role)
    assert role.valid?, 'Is not a valid role'
  end

  test 'should not be a valid role without name' do
    role = build(:role, name: nil)
    assert !role.valid?, 'Is a valid role without a name'
  end

end