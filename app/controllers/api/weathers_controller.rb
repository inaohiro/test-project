# coding utf-8

class Api::WeathersController < ApplicationController

    def index

        ## 本当はこれを使う ##


        #location = Location.new.getlocation(value)
        # location = ["url","location_name"]
        weather = Weather.new.webscrape(current_user.location.url)

        render json: {
            data: {
                weather: weather,
            }
        }

    end

end
