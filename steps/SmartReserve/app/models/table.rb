class Table < ActiveRecord::Base
  belongs_to :club
  has_many :orders
end
