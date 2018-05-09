class WelcomePageController < ApplicationController
  def welcome
    user_id = session[:guest_user_id]
    if user_id.nil?
      user = create_guest_user
    else
      user = User.find_by(id: user_id)
      if user.nil?
        user = create_guest_user
      end
    end
    sign_in user

    # When user is signed it, find their last order so that 
    # they can continue where they left off. Or create a new 
    # order right away
    order = user.orders.last
    if order.nil?
      user.orders.create()
    end

    UserMailer.welcome_email.deliver_now
  end

  def robots
    respond_to :text
    expires_in 6.hours, public: true
  end
  
end
