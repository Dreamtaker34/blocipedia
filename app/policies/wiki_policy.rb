class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present? && (user.admin? || user.premium?)
        scope.all
      else
        scope.where(:private => false)
      end
    end
  end

  def new?
    user.present?
  end

  def show?
    if record.private
      user.present? && (user.admin? || user.premium?)
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
