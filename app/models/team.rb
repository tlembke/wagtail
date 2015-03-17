class Team < ActiveRecord::Base
	belongs_to :provider
	belongs_to :person

  self.primary_keys = :person_id, :provider_id
end