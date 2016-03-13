require "rails_helper"

describe "lessons/index.html.erb" do
  subject {rendered}
  let(:user) {create :user}
  let(:subject) {create :subject}
  let(:lesson) {create :lesson}

  before do
    sign_in user
    assign :lesson, lesson
    assign :lessons, lesson
    assign :subjects, subject
    render
  end

  it do
    is_expected.to have_selector "form", method: "post", action: lesson_path do |form|
      form.is_expected.to have_selector "input", name: "user_id"
      form.is_expected.to have_selector "input", name: "status"
      form.is_expected.to have_selector "select", name: "subject_id"
      form.is_expected.to have_selector "input", type: "submit"
    end
  end

  it do
    is_expected.to have_content lesson.created_at
    is_expected.to have_content lesson.subject.name
    is_expected.to have_content lesson.status
    is_expected.to have_content lesson.spent_time
    is_expected.to have_content lesson.mark
  end
end
