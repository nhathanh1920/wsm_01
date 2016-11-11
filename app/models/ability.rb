class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    case user
    when User
      if user.manager?
        can :manage, :all
      else
        can [:read], User, id: user.id
      end
    when Admin
      can :manage, :all
    end
  end
end
