class UserMailer < ApplicationMailer
    default from: 'info@tryitontoday.com'
 
  def welcome_email
    email = "vern.jane@gmail.com"
    subject = "Welcome to Try It On Today"
    mail(to: email, subject: subject)
  end

  def item_added_email(order)
    @order = order
    @user = order.user
    @items = @order.items
    email = "vern.jane@gmail.com"
    subject = "User #{@user.id} added item to cart"
    mail(to: email, subject: subject)
  end

  def order_placed_email(order)
    @order = order
    @user = order.user
    @items = @order.items
    email = "vern.jane@gmail.com"
    subject = "ORDER PLACED. User #{@user.id}. Time: #{Time.now}"
    mail(to: email, subject: subject)
  end
end
