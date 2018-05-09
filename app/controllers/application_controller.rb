class ApplicationController < ActionController::Base


def create_guest_user
    email = "guest_#{Time.now.to_i}#{rand(100)}@example.com"
    u = User.new(:guest => true, :email => email)
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
    return u
end    

end
