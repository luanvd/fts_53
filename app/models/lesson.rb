class Lesson < ActiveRecord::Base
  enum status: [:start, :testing, :unchecked, :checked]

  belongs_to :user
  belongs_to :subject

  has_many :results
  has_many :questions, through: :results

  before_create :create_questions

  accepts_nested_attributes_for :results, allow_destroy: true

  validate :questions_less_than_require, on: :create

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
