require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should have some message text' do
    mess = build(:message , text:nil)
    assert !mess.save , 'message saved with no text, bummer!'
  end

end
