class Ability
  include CanCan::Ability

  def initialize(user)

    if user.has_role?('superadmin')
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
      can :read, :all
    else
      can :read, Event, agent_id: user.id if user
      can :update, Event, agent_id: user.id if user
      can :create, Event, agent_id: user.id if user
      can :destroy, Event, agent_id: user.id if user

      can :read, StarMother
      can :update, StarMother
      can :create, StarMother
      can :destroy, StarMother

      can :read, Agent, id: user.id if user
      can :update, Agent, id: user.id if user

      can :read, Ckeditor::Picture, :event => {:id => user.event_ids}
      can :read, Ckeditor::Picture, :agent => {:id => user.id}
      can :read, Ckeditor::Picture, assetable_id: user.id if user

      can :manage, Attendance, :event => {:id => user.event_ids}

      can :access, :rails_admin
      can :dashboard
    end

  end
end
