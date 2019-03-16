class PingController < ApplicationController
  def index
    render json: { response: 'pong' }
  end
end
