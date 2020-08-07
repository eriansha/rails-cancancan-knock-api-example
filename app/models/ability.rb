# frozen_string_literal: true

# Authorized ability made by cancancan
class Ability
  include CanCan::Ability

  def initialize(user)
    send("#{user.role}_abilities")
  end

  def admin_abilities
    can :manage, :all
  end

  def curation_abilities
    can %i[read create], :'API::V1::Admins::ProductsController'
    can :read, :'API::V1::Admins::UsersController'
  end

  def visitor_abilities
    can :read, [
      :'API::V1::Admins::ProductsController',
      :'API::V1::Admins::UsersController'
    ]
    can :read, :'API::V1::Customers::SomethingsController'
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
