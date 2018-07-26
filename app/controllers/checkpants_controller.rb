class CheckpantsController < ApplicationController

    def getFewpantsToken

        data=[]
        Token.all.each do |user|
            if user.items.length > 0
                if user.items.first.current < 3
                    if user.notification_token.length > 0
                        data.push(user.notification_token)
                    end
                end
            end
        end
        p data
        data

    end

end
