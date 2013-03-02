require 'test_helper'

class RatedImagesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should be invalid without a sensible status' do
    ri = build(:rated_image, status: 'fooo')
    assert !ri.save , 'rated image saved with goofy status'
  end
  

end
