class AppController < ApplicationController
  def top
    weather = Weather.new
    @data = weather.webscrape()

    # TODO:
    # now, user has only 1 item, pants
    # but, this should be fixed
    @item = current_user.items[0]

  end
end
