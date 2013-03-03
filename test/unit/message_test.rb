require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should have some message text' do
    mess = build(:message , text:nil)
    assert !mess.save , 'message saved with no text, bummer!'
  end

  test 'message has a receiver and sender' do
    message = build(:message)
    sender = create(:user , email: 'kimjongun@dprk.kr')
    receiver = create(:user , email: 'barak@us.gov')

    message.to = receiver.id
    message.from = sender.id
    message.save

    assert receiver.messages_inbox.count ==1, 'message not in receiver inbox!'
    assert sender.messages_outbox.count ==1, 'message not in sender outbox!'
  end

end
