class ApplicationController < ActionController::Base


def create_guest_user
    u = User.new(:guest => true, :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com")
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
end    

end
