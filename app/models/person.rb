class Person < ActiveRecord::Base
	has_many :goals
	has_and_belongs_to_many :conditions
	has_many :results
    has_many :narratives
    has_many :careroles
    has_many :measuresvalues

    validates :family_name, :given_names, presence: true
    
end
