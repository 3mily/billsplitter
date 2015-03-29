class User < ActiveRecord::Base
  has_many :events
  has_one :card
  has_many :contacts
  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true# , uniqueness: true
  validates :password, length: { in: 1..20}, on: :create
end
