require "faker"
FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {"coltech4u"}
    password_confirmation {"coltech4u"}
    role 0
    factory :admin do
      role 1
    end
  end
end
