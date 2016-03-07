class UserMailer < ApplicationMailer
  def send_statistic_when_end_of_month user
    @user = user
    @lessons = user.lessons
    mail to: @user.email, subject: t("user.lesson_statistic")
  end
end
