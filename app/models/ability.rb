class Ability
  include CanCan::Ability

  def initialize(current_user) 
    if current_user
      can [:destroy, :edit, :update], Project, owner_id: current_user.id 
      can [:index, :new, :show],      Project

      can [:destroy, :edit, :update],     Donation, user_id: current_user.id
      can [:create, :index, :new, :show], Donation
    else
      can [:create, :index, :new, :show], User
      can [:index, :show], Project
      can [:index, :show], Donation
    end
  end
end
