class Api::ItemsController < ApplicationController
  protect_from_forgery :except => ["index", "create"]

  def index
    weather = Weather.new.webscrape()
    item = current_user.items.first

    if item == nil
      render json: {
        data: {
          weather: weather,
          pants: {
            max:  0,
            current: 0
          }
        }
      }
    else
      render json: {
        data: {
          weather: weather,
          pants: {
            max: item.max,
            current: item.current
          }
        }
      }
    end
  end

  def create
    if current_user.items.length > 0
      item = current_user.items.first
    else
      item = current_user.items.build(item_params)
      item.name = "pants"
    end

    p item
    p item_params

    item.update_attributes(item_params)
  end

  private
    def item_params
      params.require(:item).permit(:name, :max, :current)
    end
end
