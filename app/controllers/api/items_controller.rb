class Api::ItemsController < ApplicationController
  protect_from_forgery :except => ["index", "create"]

  def index
    # url = 'https://tenki.jp/forecast/3/16/4410/13113/10days.html'
    # weather = Weather.new.webscrape(url)
    item = current_user.items.first

    if item == nil
      render json: {
        data: {
          pants: {
            max:  0,
            current: 0
          }
        }
      }
    else
      render json: {
        data: {
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
      item = current_user.items.build
      item.name = "pants"
      location = current_user.build_location({name: params[:location]})

      p item

    end
    Location.new.getlocation(params[:location])
    item.update_attributes({max: params[:max],current: params[:current]})
    location.update_attributes({name: params[:location]})

  end

  def updatepants
    item = current_user.items.first
    item.update_attributes({current: params[:current]})
  end

  private
    def item_params
      params.require(:item).permit(:name, :max, :current)
    end
end
