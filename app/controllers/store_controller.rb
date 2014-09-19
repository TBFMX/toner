class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
  	@cartuchos = Cartucho.order(:title)
  end
  def quienes
  end
  def contacto
  end
  def contacto_send
  	Mailer.Contact(array).send
  end	
end

