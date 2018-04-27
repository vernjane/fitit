class WelcomePageController < ApplicationController
  def welcome
  end

  def robots
    respond_to :text
    expires_in 6.hours, public: true
  end
  
end
