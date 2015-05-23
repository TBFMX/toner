#!/bin/env ruby
# encoding: utf-8
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

  def presupuesto
    @line = LineItem.where('cart_id = ?',session[:cart_id])
      @body_line = ""
      @line.each do |l|
        cartucho_line = Cartucho.find(l.cartucho_id)
        @body_line += 'cartucho modelo: ' + cartucho_line.clave.to_s + ' la cantidad de: ' + l.quantity.to_s + ' de la marca: ' + cartucho_line.brand.to_s + '<br>'
      end

  end  

  def distribuidores
  end

  def cartuchos_compatibles
  end

  def cartuchos_originales
  end

  def impresoras_otros
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
        delivery_method :smtp, {
          :address   => ENV["SMTP_ADDRESS"],
          :port      => 587,
          :domain    => "heroku.com",
          :user_name => ENV["SMTP_USER"],
          :password => ENV["SMTP_PASSWORD"],
          :authentication => :plain,
          #:enable_starttls_auto => true
        }
      end

      mail = Mail.deliver do
        to "jcmartinez@cwmex.com.mx, tponce@cwmex.com.mx"
        #to  'jcmartinez@cwmex.com.mx'#mail del webmaster #'sebastian@tbf.mx'
        from 'Servicios del Server <servidor@tonerdpt.com.mx>'
        subject 'Contacto pagina Toner'
        text_part do
          body 'Hello world in text'
        end
        html_part do
          content_type 'text/html; charset=UTF-8'
          body '<h1>Cotización:</h1>
          <p>Se ha contactado la persona:<br>
              Nombre: ' + name + '<br>
              Email: ' + email + '<br>
              Teléfono: ' + contactanos + '<br>
          </p>
            <p>Para pedir informes sobre:<br>
              
              Comentarios del comprador: ' + mensaje + '<br>
          </p>'
          #<p>Para pedir informes sobre:<br>
          #    La impresora: ' + model_printer + ' de la marca: ' + brand + ', para la cantidad ' + quantity + ' cartuchos modelo: ' + model_cartridge + '.<br>
          #    Comentarios del comprador: ' + mensaje + '<br>
          #</p>'
        end
      end

    redirect_to store_path

  end

  def presupuesto_send
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    puts params.inspect
    puts ">nombre: " + params[:name].to_s
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    
    name = params[:name]
    email = params[:email]
    contactanos = params[:contactanos]
    #brand = params[:brand]
    #model_printer = params[:model_printer]
    #model_cartridge = params[:model_cartridge]
    #quantity = params[:quantity] 
    mensaje = params[:mensaje]


    
    require 'mail'
      Mail.defaults do
        delivery_method :smtp, { :address   => ENV["SMTP_ADDRESS"],
          :port      => 587,
          :domain    => "heroku.com",
          :user_name => ENV["SMTP_USER"],
          :password  => ENV["SMTP_PASSWORD"],
          :authentication => :plain,
          #:enable_starttls_auto => true
        }
      end

      @line = LineItem.where('cart_id = ?',session[:cart_id])
      body_line = ""
      @line.each do |l|
        cartucho_line = Cartucho.find(l.cartucho_id)
        body_line += 'cartucho modelo: ' + cartucho_line.clave.to_s + ' la cantidad de: ' + l.quantity.to_s + ' de la marca: ' + cartucho_line.brand.to_s + '<br>'
      end  

      mail = Mail.deliver do
        to  "jcmartinez@cwmex.com.mx, tponce@cwmex.com.mx"
        from 'Servicios del Server <servidor@tonerdpt.com.mx>'
        subject 'Contacto pagina Toner'
        text_part do
          body 'su cliente no puede abrir este correo'
        end
        html_part do
          content_type 'text/html; charset=UTF-8'
          body '<h1>Cotización:</h1>
          <p>Se ha contactado la persona:<br>
              Nombre: ' + name + '<br>
              Email: ' + email + '<br>
              Teléfono: ' + contactanos + '<br>
          </p>

          <p>Para pedir informes sobre:<br>
              ' + body_line + '</p>'
        end
      end
      
    ##se limpia la variable carrito para que se cree uno nuevo la proxima vez 
    session[:cart_id]=nil 
    redirect_to store_path

  end 	
end
