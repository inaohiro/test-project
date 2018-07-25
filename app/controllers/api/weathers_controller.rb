# coding utf-8

class Api::WeathersController < ApplicationController

    def index

        ## 本当はこれを使う ##
        # value = params:[:location]

        value = "shibuya" # 仮value
        location = Location.new.getlocation(value)
        # location = ["url","location_name"]
        url = location[0]
        weather = Weather.new.webscrape(url)

        render json: {
            data: {
                weather: weather,
            }
        }

    end

end
