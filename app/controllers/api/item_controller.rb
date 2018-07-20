class Api::ItemController < ApplicationController
  def create
    # 数とか登録する
    # token と結びつける
    user = Token.find(params[:token])
    item = user.items.build(item_params)

    if item.save
      render json: {
        status: 'ok'
      }
    else
      render json: {
        status: 'bad'
      }
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :max, :current)
    end
end
