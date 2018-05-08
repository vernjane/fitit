class WelcomePageController < ApplicationController
  def welcome
    user_id = session[:guest_user_id]
    if user_id.nil?
      user = create_guest_user
    else
      user = User.find(user_id)
      if user.nil?
        user = create_guest_user
      end
    end
    sign_in user
  end

  def robots
    respond_to :text
    expires_in 6.hours, public: true
  end
  
end
