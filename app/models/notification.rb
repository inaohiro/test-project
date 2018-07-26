class Notification < ApplicationRecord
  belongs_to :token

  def notify(notification_token)
    if ENV["SERVER_ID"]
      serverid = ENV["SERVER_ID"]

      # header1 = "Authorization: key=#{serverid}"
      # header2 = "Content-Type: application/json"
      # data = {
      #   to: notification_token,
      #   notification: {
      #     body: "Hi, I\'m Pants Manager"
      #   }
      # }

      # system("curl -X POST --header #{header1} --header #{header2} -d #{data.to_json} https://fcm.googleapis.com/fcm")

      client = HTTPClient.new
      client.post("https://fcm.googleapis.com/fcm", header: [["Authorization", "key=#{serverid}"], ["Content-Type", "application/json"]], body: data.to_json)
    else
      p "hoge"
    end
  end
end
