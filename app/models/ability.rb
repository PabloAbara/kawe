class Ability
    include CanCan::Ability

    def initialize(user)
        if user.role == :mentor
            puts "SOY MENTOR"
            can :manage, :all
            # can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
        else
            puts "SOY ESTUDIANTE"
            can :read, :all
            can :create, Resource
        end
    end
end
