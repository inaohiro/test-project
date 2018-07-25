# coding: utf-8

class WeatherController < ApplicationController

  def controller
    weather = Weather.new
    @data = weather.webscrape()
  end

end
