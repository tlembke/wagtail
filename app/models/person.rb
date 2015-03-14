class Person < ActiveRecord::Base
	has_many :goals
	has_and_belongs_to_many :conditions
	has_many :results
    has_many :narratives
    has_many :careroles
    has_many :measuresvalues

    validates :family_name, :given_names, presence: true

    def family_name_given_names
   		if self.given_names.blank?
     		return self.family_name
   		else
     		return self.family_name+", "+self.given_names
   		end
 	end

 	def full_name
   		if self.given_names.blank?
     		return self.family_name
  		 else
     		return self.given_names+" "+self.family_name
   		end
 	end

 	def full_name_known_as
 		r=self.given_names
 		r=r+" " unless r.blank?
 		r=r+"'"+self.known_as+"' " unless self.known_as.blank? or self.known_as==self.given_names
   		r=r+self.family_name
   		return r
 	end

    def address
      	address= self.address_line
    	address+=", " if self.address_line!=""
    	address+=self.town
  	end

  	def full_address
    	r = address_line
    	r+="\n" unless address_line.blank?
    	r+= town+" "+postcode
    	return r
  	end

  	def gender
  		self.sex=0? r="Male" : r="Female"
  		return r
  	end
 end
