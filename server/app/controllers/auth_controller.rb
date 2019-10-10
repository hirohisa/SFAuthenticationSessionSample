class AuthController < ApplicationController
  def index
    token = cookies.signed[:sample]
    if token.nil?
      token = SecureRandom.hex(8)[0..8]
      cookies.permanent.signed[:sample] = "token:" + token
    end

    redirect_to "sfauth-sample://sso_test?token=#{token}"
  end
end
