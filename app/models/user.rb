class User < ActiveRecord::Base
  has_many :events
  has_one :card
  has_many :contacts
end
