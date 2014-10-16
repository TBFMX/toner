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

  def distribuidores
  end

  def contacto_send
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    puts params.inspect
    puts ">nombre: " + params[:name].to_s
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    
    name = params[:name]
    email = params[:email]
    contactanos = params[:contactanos]
    brand = params[:brand]
    model_printer = params[:model_printer]
    model_cartridge = params[:model_cartridge]
    quantity = params[:quantity] 
    mensaje = params[:mensaje]
    
    require 'mail'
      Mail.defaults do
        delivery_method :smtp, { :address   => "smtp.gmail.com",
                                 :port      => 587,
                                 :domain    => "tbf.mx",
                     :user_name => "arturito@tbf.mx",
                     :password => "vampirocanadiense",
                                 :authentication => :login,
                                 :enable_starttls_auto => true }
      end

      mail = Mail.deliver do
        to ''#mail del webmaster
        from 'Arturito <arturito@tbf.mx>'
        subject 'Contacto pagina Toner'
        text_part do
          body 'Hello world in text'
        end
        html_part do
          content_type 'text/html; charset=UTF-8'
          body '<b>Hello world in HTML</b>'
        end
      end

    redirect_to store_path

  end	
end
