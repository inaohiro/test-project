# coding: utf-8

class WeatherController < ApplicationController
  
  def controller
    weather = Weather.new
    @msg = weather.webscrape()
  end

end
