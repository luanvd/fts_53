class Lesson < ActiveRecord::Base
  enum status: [:start, :testing, :unchecked, :checked]

  belongs_to :user
  belongs_to :subject

  has_many :results
  has_many :questions, through: :results

  before_create :create_questions
  after_update :send_result_lesson_email

  accepts_nested_attributes_for :results, allow_destroy: true

  validate :questions_less_than_require, on: :create

  def time_remaining
    Settings.duration * Settings.lesson.second_per_minute - self.spent_time.to_i
  end

  def time_spent
    self.spent_time.to_i + (Time.zone.now - self.updated_at).to_i
  end

  def score
    self.results.where(correct: true).size
  end

  def send_result_lesson_email
    HardWorker.perform_async self.id if self.checked?
  end

  private
  def questions_less_than_require
    errors.add :create, I18n.t("lesson.create_failed") if self.subject.
      questions.approved.size < Settings.number_questions_of_lesson
  end

  def create_questions
    self.subject.questions.approved.order("RANDOM()").limit(Settings.
      number_questions_of_lesson).each do |question|
        self.results.build question_id: question.id
      end
  end
end
