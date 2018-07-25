class Api::TokensController < ApplicationController

  protect_from_forgery :except => ["create"]

  def create

    if params[:token].instance_of?(String) == true
      user = Token.find_by(token: params[:token])
      log_in user
      render json: {
        token: user.token
      }
    else
      # token を発行する
      token = Token.new

      # ユーザに保存してもらう token
      token_string = token.generate

      # データベースに保存する
      token.update_attributes(token: token_string)

      log_in token

      render json: {
        token: token_string
      }
    end

  end
end
