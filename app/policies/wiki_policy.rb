class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present? && user.admin?
        scope.all
      else
        scope.find_by_private_and_user_id(false, user.id)
        # scope.where(:private => false)

      end
    end
  end

  def new?
    user.present?
  end

  def show?
    if record.private
      user.present? && (user.admin? || user.id == @record.user_id || user.id == @record.collaborators.user_id)
    else
      true
    end
  end

  def create?
    user.present?
  end

  def update?
    puts "hello there!"
    user.present?
  end
end
