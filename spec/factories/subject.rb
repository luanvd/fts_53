require "faker"
FactoryGirl.define do
  factory :subject do |subject|
    name {Faker::Name.name}
  end
end
