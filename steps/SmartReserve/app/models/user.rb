class User < ActiveRecord::Base
  has_many :orders
  has_many :comments
  has_many :subscribes
  has_many :rates
  has_many :clubs
end
