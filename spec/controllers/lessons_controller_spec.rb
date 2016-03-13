require "rails_helper"
RSpec.describe LessonsController, type: :controller do
  let(:lesson){create :lesson}
  let(:user){create :user}
  let(:subject){create :subject}

  before do
    sign_in user
    allow(controller).to receive(:current_user).and_return user
  end

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(assigns(:subject) == [subject])
      expect(assigns(:lesson)).to be_a_new Lesson
      expect(response).to render_template("lessons/index")
      expect(response).to render_template("layouts/application")
    end
  end
end
