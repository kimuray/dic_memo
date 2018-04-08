# Preview all emails at http://localhost:3000/rails/mailers/assign_mailer
class AssignMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/assign_mailer/sendmail_assigned
  def sendmail_assigned
    AssignMailerMailer.sendmail_assigned
  end

end
