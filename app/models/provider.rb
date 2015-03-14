class Provider < ActiveRecord::Base
	belongs_to :organisation
	belongs_to :craft
	has_one :user


    def full_name
    	r=self.family_name
    	if self.given_names
    		r=self.given_names+" "+r
    	end
   		if self.title
     		r=self.title+" "+r
   		end
   		return r
 	end
end
