class Organisation < ActiveRecord::Base
	has_many :providers
	belongs_to :provider
end
