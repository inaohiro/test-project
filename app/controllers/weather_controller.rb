class WeatherController < ApplicationController
  def show
    @data = Weather.fetch
  end
end
