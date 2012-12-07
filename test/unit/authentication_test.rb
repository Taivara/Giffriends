require 'test_helper'

class AuthenticationTest < ActiveSupport::TestCase

  test 'should be a valid authentication with all proper fields' do
    authentication = build(:authentication)
    assert authentication.valid?, 'Is not a valid authentication'
  end

  test 'should not be a valid authentication without uid' do
    authentication = build(:authentication, uid: nil)
    assert !authentication.valid?, 'Is a valid authentication without uid'
  end

  test 'should not be a valid authentication without a provider' do
    authentication = build(:authentication, provider: nil)
    assert !authentication.valid?, 'Is a valid authentication without provider'
  end

end