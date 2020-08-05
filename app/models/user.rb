class User < ActiveRecord::Base
  has_secure_password

  def to_token_payload
    {
      sub: id,
      email: email,
      test: ""
    }
  end
end
