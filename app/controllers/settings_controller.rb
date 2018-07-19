class SettingsController < ApplicationController
  def settings
    # query init = true button
    @data = params[:init]
  end

  def tutorial
    # query init = true
    @data = params[:init]
  end
end
