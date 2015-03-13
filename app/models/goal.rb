class Goal < ActiveRecord::Base
  belongs_to :measure
  belongs_to :condition
  has_many :tasks
end
