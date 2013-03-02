class RatedImages < ActiveRecord::Base
  belongs_to :image
  attr_accessible :status
end
