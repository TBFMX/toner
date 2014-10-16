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
        delivery_method :smtp, { :address   => "smtp.sendgrid.net",
                                 :port      => 587,
                                 :domain    => "tbf.mx",
                                 :user_name => "davidzu",
                                 :password => "Mictlan9",
                                 :authentication => :login,
                                 :enable_starttls_auto => true }
      end

      mail = Mail.deliver do
        to 'sebastian@tbf.mx' #'información@tonerdpt.com.mx'#mail del webmaster
        from 'Servicios del Server <servidor@tonerdpt.com.mx>'
        subject 'Contacto pagina Toner'
        text_part do
          body 'Hello world in text'
        end
        html_part do
          content_type 'text/html; charset=UTF-8'
          body '<h1>Cotización:</h1>
          <p>Se a contactado la persona:<br>
              Nombre: ' + name + '<br>
              Email: ' + email + '<br>
              Teléfono: ' + contactanos + '<br>
          </p>

          <p>Para pedir informes sobre:<br>
              La impresora: ' + model_printer + ' de la marca: ' + brand + ', para la cantidad ' + quantity + ' cartuchos modelo: ' + model_cartridge + '.<br>
              Comentarios del comprador: ' + mensaje + '<br>
          </p>'
        end
      end

    redirect_to store_path

  end	
end
