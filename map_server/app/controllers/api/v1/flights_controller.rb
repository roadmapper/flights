module Api
  module V1
    class FlightsController < ApplicationController
      before_action :authenticate

      def index
        render json: {message: "Resource not found"}, status: 404
      end

      def find_lat_long_data(lat, long, quantity)
	    point = [lat, long]
	    @flights = Flight.geo_near(point).max_distance(5).take(quantity)
	  end

	  def find_lat_long
	    render json: find_lat_long_data(params[:lat].to_f, params[:long].to_f, params[:quantity].to_i)
	  end

	  private
	  def authenticate
	  	authenticate_or_request_with_http_token do |token, options|
	    	ApiKey.where(access_token: token).exists?
	   	end
	  end
	  
    end
  end
end
