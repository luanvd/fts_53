require "faker"
FactoryGirl.define do
  factory :question, class: Question do
    content {Faker::Lorem.sentence}
    status :approved
    user_id 1
    subject_id 1
  end
end
