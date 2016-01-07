class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def update?
    puts "hello there!"
    user.present?
  end
end
