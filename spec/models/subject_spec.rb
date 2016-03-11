require "rails_helper"

RSpec.describe Subject, type: :model do
  let!(:subject) {FactoryGirl.create :subject}

  it {is_expected.to respond_to :name}

  describe Subject do
    subject {FactoryGirl.create :subject}
    it {is_expected.to be_valid}
  end

  context "subject is valid" do
    it {expect(subject.errors).to be_empty}
    it {expect(subject.name.length).to be <= 50}
  end
end
