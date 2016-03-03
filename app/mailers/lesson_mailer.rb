class LessonMailer < ApplicationMailer
  def notify_delay lesson
    @lesson = lesson
    @user = lesson.user
    mail to: @user.email, subject: t("lesson.lesson_delay")
  end

  def send_statistic_when_end_of_month lesson
    @lesson = lesson
    @user = lesson.user
    mail to: @user.email, subject: t("lesson.lesson_statistic")
  end
end
