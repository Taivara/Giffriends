class Message < ActiveRecord::Base
  attr_accessible :from, :text, :to
end
