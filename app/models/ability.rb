# frozen_string_literal: true
require 'cancancan'

class Ability
  include CanCan::Ability

  def initialize(user)
    send("#{user.role}_abilities", user)
  end

  def admin_abilities(user)
    can :manage, :all
  end

  def curation_abilities(user)
    can [:read, :create], Product
  end

  def visitor_abilities(user)
    can :read, all
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
