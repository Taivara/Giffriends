class Match < ActiveRecord::Base
  attr_accessible :match_id, :user_id, :interested

  belongs_to :user
  has_one :complement, :class_name => Match, 
    :foreign_key => :match_id,

end
