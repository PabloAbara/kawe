class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == "mentor"
      can :manage, :all
      can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"

    else
      # can :manage, :all
      can :read, :all
      can :create_resource, :all
      # can :update, Resource, user: user
      # can :destroy, Resource, user: user
    end
  end
end
