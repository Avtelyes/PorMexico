class MainController < ApplicationController
  require 'open-uri'
  def index
  end
  def location
    respond_to do |format|
      format.json {
        lat = params["lat"]
        lng = params["lng"]
        radius = 5000
        type = "restraunt"
        key = "AIzaSyBceReKb_lDX5l3OzFVkuhsoV_C_Me6II4"
        url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=#{radius}&types=#{type}&key=#{key}"
        data = JSON.load(open(url))
        render json: { :data => data }
      }
    end
  end
end
