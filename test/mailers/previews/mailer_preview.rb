# Preview all emails at http://localhost:3000/rails/mailers/mailer
class MailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mailer/Contact
  def Contact
    Mailer.Contact
  end

  # Preview this email at http://localhost:3000/rails/mailers/mailer/Order
  def Order
    Mailer.Order
  end

  # Preview this email at http://localhost:3000/rails/mailers/mailer/Confirmation
  def Confirmation
    Mailer.Confirmation
  end

end
