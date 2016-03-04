class LessonMailer < ApplicationMailer
  def notify_delay lesson
    @lesson = lesson
    @user = lesson.user
    mail to: @user.email, subject: t("lesson.lesson_delay")
  end

  def lesson_result lesson
    @lesson = lesson
    @user = lesson.user
    mail to: @user.email, subject: t("lesson.lesson_result")
  end
end
