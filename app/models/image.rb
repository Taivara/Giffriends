class Image < ActiveRecord::Base
  attr_accessible :imgur_id

  validates :imgur_id , presence: true

end
