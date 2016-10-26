class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
        if user.has_role?("user")
            cannot :read, User
        elsif user.has_role?("admin")
            cannot :read, User
        elsif user.has_role?("superadmin")
            can :read, User
        else
            cannot :read, User
        end
  end
end
