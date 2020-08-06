class User < ActiveRecord::Base
  has_secure_password

  def to_token_payload
    {
      sub: self.id,
      name: self.name,
      role: self.role,
      rules: Ability.new(self).to_list
    }
  end
end
