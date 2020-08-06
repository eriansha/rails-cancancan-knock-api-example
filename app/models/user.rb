class User < ActiveRecord::Base
  has_secure_password

  def to_token_payload
    {
      name: self.name,
      rules: Ability.new(self).to_list
    }
  end
end
