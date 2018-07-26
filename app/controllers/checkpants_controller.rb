class CheckpantsController < ApplicationController

    def getFewpantsToken

        # data=[]
        # Token.all.each do |user|
        #     if user.items.length > 0
        #         if user.items.first.current < 3
        #             unless user.notification_token.empty?
        #             #if user.notification_token.length > 0
        #                 data.push(user.notification_token)
        #             end
        #         end
        #     end
        # end
        # p data
        # data

        Token.all.each do |user|
          if user.notification
            Notification.new.notify( user.notification.notification_token )
            sleep(0.02)
          end
        end

    end

end
