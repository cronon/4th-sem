class Club < ActiveRecord::Base
  has_many :tables
  has_many :orders
end
