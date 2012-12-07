class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid

  validates :provider, presence: true
  validates :uid, presence: true

  belongs_to :user
end
