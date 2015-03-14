class Craft < ActiveRecord::Base
	belongs_to :provider
	has_many :providers
end
