class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      can :read,   User, id: user.id
      can :update, User, id: user.id
      can :create, User
      cannot :index, User
    end

  end
end