class Cartucho < ActiveRecord::Base
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item


	def self.search(modelo,marca)
		listo = false

		aux = '%' + modelo + '%'
		aux2 = '%' + marca + '%'
		unless modelo.blank? || marca.blank?
			
			#aux = search 
			puts "entron ambos"
			listo = true
			return where('model LIKE ? or brand LIKE ? ', aux,aux2)
			#.order('package DESC,rank ASC, priority ASC')
			
		else
			unless modelo.blank?
				listo = true
				puts "entro modelo"
				return where('model LIKE ? ', aux)
				
		    end
		    unless marca.blank?
		    	listo = true
				puts "entro marca"
				puts aux2
		    	return where('brand LIKE ? ', aux2)
				
		    end
		end
		if listo == false
			all
		end

	end
	def self.search_imp(modelo,marca)
		listo = false

		aux = '%' + modelo + '%'
		aux2 = '%' + marca + '%'
		unless modelo.blank? || marca.blank?
			
			#aux = search 
			puts "entron ambos"
			listo = true
			return where('model LIKE ? or brand LIKE ? ', aux,aux2)
			#.order('package DESC,rank ASC, priority ASC')
			
		else
			unless modelo.blank?
				listo = true
				puts "entro modelo"
				return where('impresoras LIKE ? ', aux)
				
		    end
		    unless marca.blank?
		    	listo = true
				puts "entro marca"
				puts aux2
		    	return where('brand LIKE ? ', aux2)
				
		    end
		end
		if listo == false
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
