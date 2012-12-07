class Role < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  belongs_to :user
end
