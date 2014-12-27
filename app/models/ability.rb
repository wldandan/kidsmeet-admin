class Ability
  include CanCan::Ability

  def initialize(user)

    if user.has_role?('superadmin')
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
      can :read, :all
      #if user.has_role?('superadmin')
      #  can :manage, :all
      #else
      #  can :read, :all
      #end
    else
      can :read, Event, agent_id: user.id if user
      can :update, Event, agent_id: user.id if user
      can :create, Event, agent_id: user.id if user
      can :destroy, Event, agent_id: user.id if user

      can :read, Agent, id: user.id if user
      can :update, Agent, id: user.id if user

      can :read, Ckeditor::Picture, :event => {:id => user.event_ids}
      can :read, Ckeditor::Picture, :agent => {:id => user.id}
      can :read, Ckeditor::Picture, assetable_id: user.id if user

      can :manage, Attendance, :event => {:id => user.event_ids}

      can :access, :rails_admin
      can :dashboard

      #can :manage, Ckeditor::Picture
      #can :manage, Event
      #can :manage, :all
    end

      # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
