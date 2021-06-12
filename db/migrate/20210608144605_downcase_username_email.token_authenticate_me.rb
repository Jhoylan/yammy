# This migration comes from token_authenticate_me (originally 20180123184510)
class DowncaseUsernameEmail < ActiveRecord::Migration[4.2]
  class TokenAuthenticateMe::User < ActiveRecord::Base
  end

  def change
    TokenAuthenticateMe::User.find_each do |user|
      user.username = user.username.downcase
      user.email = user.email.downcase
      user.save!(validate: false)
    end
  end
end
