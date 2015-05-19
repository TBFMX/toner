class Mailer < ActionMailer::Base
  default from: "abchavz@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.Contact.subject
  #
  def Contact(array)
    @greeting = "Hi"
    mail to: "abchavz@yahoo.com.mx"
    #mail to: "jcmartinez@cwmex.com.mx"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.Order.subject
  #
  def Order(cart)
    #@greeting = "Hi"
    @cart = Cart.find(cart)
    mail to: "to@example.org" #pendiente
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.Confirmation.subject
  #
  def Confirmation(email,cart)
    #@greeting = "Hi"
    @cart = Cart.find(cart)
    mail to: email
  end
end
