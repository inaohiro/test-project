class Api::TokensController < ApplicationController

  protect_from_forgery :except => ["create"]

  def create
    # token を発行する
    token = Token.new

    # ユーザに保存してもらう token
    token_string = token.generate

    puts token_string

    # データベースに保存する際はハッシュ化する
    token.update_attributes(hashed_token: token.hash(token_string))

    render json: {
      token: token_string
    }
  end
end
