class Guest < ApplicationRecord
  belongs_to :hotel
  has_many :tasks
end
