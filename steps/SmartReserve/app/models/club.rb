class Club < ActiveRecord::Base
  has_many :tables
  belongs_to :user
  has_many :comments
  has_many :news
  has_many :rates
  belongs_to :category
  has_many :subscribes
end
