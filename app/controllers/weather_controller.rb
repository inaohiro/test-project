# coding: utf-8

class WeatherController < ApplicationController
  
  def controller

    Weather.webscrape()

  end

end
