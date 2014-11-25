class PublicationType < ActiveRecord::Base
	has_many :publication_subtypes
	has_many :attribute_positions

	validates :name , presence: true , uniqueness: true
	
	def self.getId name
		p = PublicationType.where(name: name).first
		if p == nil
			d = PublicationType.new(name: name)
			d.save
			return d.id
		else
			return p.id
		end
	end
end
