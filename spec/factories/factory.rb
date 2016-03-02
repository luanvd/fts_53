FactoryGirl.define do

  factory :user do
    name  {Faker::Name.name}
    email {Faker::Internet.email}
    password "coltech4u"
    password_confirmation "coltech4u"
    role 0
  end

  factory :supervisor_luanvd, class: User do
    name  "Vu Duc Luan"
    email "vu.duc.luan@framgia.com"
    password "coltech4u"
    password_confirmation "coltech4u"
    role 1
  end

  factory :supervisor_dieunb, class: User do
    name  "Nguyen Binh Dieu"
    email "nguyen.binh.dieu@framgia.com"
    password "12345678"
    password_confirmation "12345678"
    role 1
  end

end
