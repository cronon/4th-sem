class Rate < ActiveRecord::Base
  belongs_to :rating_type
  belongs_to :club
  belongs_to :user
end