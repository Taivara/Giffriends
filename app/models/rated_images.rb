class RatedImages < ActiveRecord::Base
  belongs_to :image
  attr_accessible :status

  validates :status, :inclusion => 1..4,

end
