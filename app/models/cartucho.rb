class Cartucho < ActiveRecord::Base
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	#nota: pude haber usado push pero es para que fuera mas facil de entender y fuera simetrico
	def self.query(cartucho)
	    @aux= " 1 = 1 "
	    @aux2= Array.new
	    @cont=1
	    if cartucho
		    if !cartucho[:brand].blank?
		    	@aux= @aux + 'and brand = ? '
		    	@aux2[@cont]=  cartucho[:brand]
		    	@cont=@cont+1
		    end
		    if !cartucho[:impresoras].blank?
		    	@aux= @aux + 'and impresoras = ? '
		    	@aux2[@cont]=  cartucho[:impresoras]
		    	@cont=@cont+1
		    end
		end
	    if @aux
	    #puts @cont	
		      @aux2[0]=@aux
	      where @aux2 
	    else
	      scoped
	    end

	end	

	def self.search(modelo_c,marca,modelo_i)
		
		listo = false

		
		
		
	@aux= " 1 = 1 "
	    @aux2= Array.new
	    @cont=1
	    
		    if !modelo_c.blank?
		    	modelo_sc = '%' + modelo_c + '%'
		    	@aux= @aux + 'and clave LIKE ? '
		    	@aux2[@cont]=  modelo_sc
		    	@cont=@cont+1
		    	
		    end
		    if !marca.blank?
		    	@aux= @aux + 'and brand = ? '
		    	@aux2[@cont]=  marca
		    	@cont=@cont+1
		    end
		    if !modelo_i.blank?
		    	modelo_si = '%' + modelo_i + '%'
		    	@aux= @aux + 'and impresoras LIKE ? '
		    	@aux2[@cont]= modelo_si
		    	@cont=@cont+1
		    end

		    

		    
	    if @aux
	    #puts @cont	
		      @aux2[0]=@aux
		      
	      where @aux2 
	    else
	      scoped
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
