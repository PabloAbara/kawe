class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == "mentor"
      can :manage, :all
      can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"

    else
      can :read, :all
      can :create_resource, :all
      can :rate_resource, :all
    end
  end
end
