class Condition < ActiveRecord::Base
  has_many :measures
  has_many :goals
  has_and_belongs_to_many :people

  validates :name, presence: true
  
end
