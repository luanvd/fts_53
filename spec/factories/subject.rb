require "faker"
FactoryGirl.define do
  factory :subject do
    name {Faker::Name.name}
  end
end
