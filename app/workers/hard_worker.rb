class HardWorker
  include Sidekiq::Worker
  def perform lesson_id
    lesson = Lesson.find lesson_id
    LessonMailer.lesson_result(lesson).deliver_now
  end
end
