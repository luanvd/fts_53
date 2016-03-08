require "rails_helper"
require "cancan/matchers"
require "factory_girl_rails"
RSpec.describe User, type: :model do

  let!(:user) {FactoryGirl.create :user}
  let!(:user_other) {FactoryGirl.create :user}

  it {is_expected.to respond_to :name}
  it {is_expected.to respond_to :email}
  it {is_expected.to respond_to :password}
  it {is_expected.to respond_to :password_confirmation}
  it {is_expected.to respond_to :role}

  describe User do
    subject {FactoryGirl.create :user}
    it {is_expected.to be_valid}
  end

  context "email" do
    subject {build :user}
    it "has been send" do
      expect{User.send_statistic_when_end_of_month}.to change {ActionMailer::
        Base.deliveries.count}
    end
  end

  context "is valid account" do
    it "name is blank" do
      user.email = ""
      expect(user.save).to be_falsey
    end

    it "name has length > 100" do
      expect(user.name.length).to be <= 100
    end

    it "email is dulicates" do
      expect{
        user_other.email = user.email
        user_other.save
      }.to change {User.count}.by 0
    end

    it "password is blank" do
      user.password = ""
      expect(user.save).to be_falsey
    end

    it "password lenght < 8" do
      expect(user.password.length).to be >= 8
    end

    it "password_confirmation is blank" do
      user.password_confirmation = ""
      expect(user.save).to be_falsey
    end
  end

  describe "admin abilities" do
    context "user is an admin" do
      let(:user) {FactoryGirl.create :admin}
      subject(:ability) {Ability.new(user, "Admin")}

      it {should be_able_to(:manage, Subject)}
      it {should be_able_to(:manage, User)}
      it {should be_able_to(:manage, Question)}
    end

    context "user is a member" do
      let(:user) {FactoryGirl.create :user}
      subject(:ability) {Ability.new(user,"")}
      it {should_not be_able_to(:create, Subject)}
      it {should be_able_to(:update, User)}
      it {should be_able_to(:create, Lesson)}
    end
  end
end
