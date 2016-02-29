class LessonsController < ApplicationController
  load_and_authorize_resource

  def index
    @lessons = @lessons.page(params[:page]).per Settings.per_page
    @subjects = Subject.all
  end

  def create
  end
end
