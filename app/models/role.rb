class Role < ActiveRecord::Base
  attr_accessible :type

  belongs_to :user
end
