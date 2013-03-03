class Message < ActiveRecord::Base
  attr_accessible :from, :text, :to

  belongs_to :sender, class_name: User, :foreign_key => :from
  belongs_to :receiver, class_name:User, :foreign_key => :to

  validates :text, presence: true

end
