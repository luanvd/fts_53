class Ability
  include CanCan::Ability

  def initialize user, controller_namespace
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif controller_namespace == "Admin"
      cannot :read, :all
    else
      can :update, User, id: user.id
      can :index, Question
      can :show, Question do |question|
        question.user == user
      end
      can :create, Question
    end
  end
end
