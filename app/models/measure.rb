class Measure < ActiveRecord::Base
  has_one :goal
  has_many :measurevalues, :order => "created_at DESC"
end
