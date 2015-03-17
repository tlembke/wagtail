class Organisation < ActiveRecord::Base
	has_many :providers
	belongs_to :provider



    def address
      r=""
    	if self.address_line!=""
    		r=self.address_line+"<br>"
    	end
    	if self.address_line_2!=""
    		r=r+self.address_line_2+"<br>"
    	end
   		r=r+self.town+" "+self.state+" "+self.postcode
   		return r
 	end
 end