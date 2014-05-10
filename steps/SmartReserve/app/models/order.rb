class Order < ActiveRecord::Base
  belongs_to :club
  belongs_to :table
end
