require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test 'image must have imgur_id' do
    image = build(:image, imgur_id: nil)
    assert !image.save, 'image saved without imgur_id'
  end
end
