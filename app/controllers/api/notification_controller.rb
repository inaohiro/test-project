class Api::NotificationController < ApplicationController

  protect_from_forgery :except => ["get", "push"]

  def get
    Notification.new.notify(current_user.notification.notification_token) unless current_user.notification.notification_token.empty?
  end

  def push
    notification = current_user.build_notification
    notification.update_attributes({notification_token:  params[:notification]})
  end

end
