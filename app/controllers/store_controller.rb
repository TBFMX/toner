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
        puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    puts params.inspect
    puts ">nombre: " + params[:name].to_s
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    name = params[:name]
    email = params[:email]
    contactanos = params[:contactanos]
    mensaje = params[:mensaje]
    Mailer.contact(name.to_s, email.to_s,contactanos.to_s, mensaje.to_s).deliver
    redirect_to store_path
  end	
end

