class Api::TokensController < ApplicationController

  protect_from_forgery :except => ["create"]

  def create
    # token を発行する
    # 一応 URL safe なもの

    render json: {
      token: "hogehoge"
    }
  end
end
