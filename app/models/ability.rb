# frozen_string_literal: true

# Authorized ability made by cancancan
class Ability
  include CanCan::Ability

  def initialize(user)
    # alias_action :create, :to => :create
    send("#{user.role}_abilities")
  end

  def admin_abilities
    can :manage, :all
  end

  def curation_abilities
    can %i[read create], Product
  end

  def visitor_abilities
    can :index, Product
    can :show, Product, { id: 13 }
  end

  def to_list
    rules.map do |rule|
      object = { action: rule.actions, subject: rule.subjects.map{ |s| s.is_a?(Symbol) ? s : s.name } }
      object[:conditions] = rule.conditions unless rule.conditions.blank?
      object[:inverted] = true unless rule.base_behavior
      object
    end
  end
end
