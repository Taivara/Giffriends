class Role < ActiveRecord::Base
  attr_accessible :type

  validates :name, presence: true

  belongs_to :user
end
