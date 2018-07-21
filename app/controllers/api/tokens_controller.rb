class Api::TokensController < ApplicationController

  protect_from_forgery :except => ["create"]

  def create
    #user = Token.find_by(token: Token.hash(params[:token]))
    user = Token.find_by(token: params[:token])

    if user
      log_in user
      #redirect_to app_path
      #render :js => "window.location = #{app_path.to_json}"
    else
      # token を発行する
      token = Token.new

      # ユーザに保存してもらう token
      token_string = token.generate

      puts token_string

      # データベースに保存する
      #token.update_attributes(hashed_token: Token.hash(token_string))
      token.update_attributes(token: token_string)

      log_in token

      render json: {
        token: token_string
      }
    end

  end
end
