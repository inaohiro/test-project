class SettingsController < ApplicationController
  def settings
    @item = current_user.items.build if logged_in?
  end

  def tutorial
    # query init = true
    @data = params[:init]
  end

  def create
    item = current_user.items.build(item_params)
    item.name = "pants"

    if item.save
      redirect_to app_path
    else
      render 'settings'
    end
  end

  private
    def item_params
      params.require(:item).permit(:max, :current)
    end
end
