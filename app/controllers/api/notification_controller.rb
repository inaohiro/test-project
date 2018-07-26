class Api::NotificationController < ApplicationController

    def push

        notification = current_user.build_notification
        notification.update_attributes({notification_token:  params[:notification]})

    end

end
