class Printer < ActiveRecord::Base
	has_many :brands , :class_name => 'Brand'
end
