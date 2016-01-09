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
  end

  def create?
    user.present?
  end

  def update?
    puts "hello there!"
    user.present?
  end
end
