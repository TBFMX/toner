class Cartucho < ActiveRecord::Base
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item


	def self.search(search)
	  if search
	  	aux = '%' + search + '%'
	  	#aux = search 
	    where('name LIKE ? or description LIKE ? or etiquetas LIKE ?', aux,aux,aux)
	    #.order('package DESC,rank ASC, priority ASC')
	  else
	    all
	  end
	end

	private
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items Present')
				return false
			end
		end
end
