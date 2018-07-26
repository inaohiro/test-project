class Api::NotificationController < ApplicationController

  def get
    Notification.send(current_user.notification_token) if current_user.notification_token
  end

  def push
    notification = current_user.build_notification
    notification.update_attributes({notification_token:  params[:notification]})
  end

end
