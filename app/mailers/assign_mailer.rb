class AssignMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.assign_mailer.sendmail_assigned.subject
  #
  def sendmail_assigned(user, password, project)
    @user = user
    @password = password
    @project = project

    mail to: @user.email,
    subject: "#{@project.name}に#{@user.name}さんがアサインされました！"
  end
end
