class SubjectNotifier < ApplicationMailer
  def send_new_subject_email user, subject
    @user = user
    @subject = subject
    mail to: @user.email, subject: t("subject.title_mailer")
  end
end
