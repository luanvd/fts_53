class LessonDelay
  def send_email_delay_lesson
    LessonMailer.notify_delay(self).deliver_now
  end

  handle_asynchronously :send_email_delay_lesson,
    run_at: Proc.new {8.hours.from_now}
end
