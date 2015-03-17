class Provider < ActiveRecord::Base
	belongs_to :organisation
	belongs_to :craft
	has_one :user
  has_many :teams
  has_many :people, :through =>:teams


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

 def self.getSelectOptions
    @providers=Provider.order(:family_name)
    if @providers
      orgs=[]
      p="<optgroup label='Providers'>\n"
      o="<optgroup label='Organisations'>\n"
      for provider in  @providers
              if provider.family_name.blank?
                  orgs<<provider
              else
                p+="<option value='"+provider.id.to_s+"'>"+provider.family_name+", "+provider.given_names
                if provider.organisation.name
                   p+=" - "+provider.organisation.name
                end
                p+="</option>"
              end
       end
       orgs.sort_by!{|e| e.organisation.name}
       for org in orgs
            o+="<option value='"+org.id.to_s+"'>"+org.organisation.name+"</option>"
       end
    end

    return p+o

end

end
