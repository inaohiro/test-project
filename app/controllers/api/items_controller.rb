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
      location = current_user.location
      item = current_user.items.first
    else
      item = current_user.items.build(item_params)
      item.name = "pants"
      location = current_user.location.build(params[:location])
    end

    item.update_attributes(item_params)
    location.update_attributes(params[:location])
  end

  private
    def item_params
      params.require(:item).permit(:name, :max, :current)
    end
end
