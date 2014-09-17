class Mailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.Contact.subject
  #
  def Contact
    @greeting = "Hi"

    mail to: "to@example.org"
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
  def Confirmation(mail)
    #@greeting = "Hi"
    @cart = Cart.find(cart)
    mail to: "mail"
  end
end
