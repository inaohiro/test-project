class Notification < ApplicationRecord
  belongs_to :token_id

  def send(notification_token)
    if ENV["SERVER_ID"]
      SERVER_ID = ENV["SERVER_ID"]
      data = {
        to: notification_token,
        notification: {
          body: "Hi, I\'m Pants Manager"
        }
      }

      system("curl -X POST --header #{SERVER_ID} --header \"Content-Type: application/json\" -d #{data.to_json} https://fcm.googleapis.com/fcm")
    else
    end
  end
end
