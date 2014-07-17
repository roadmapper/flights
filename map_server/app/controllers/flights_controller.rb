class FlightsController < ApplicationController
  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all
    render json: @flights
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
    @flight = Flight.find(params[:id])
    render json: @flight
  end

  def find_lat_long_data(lat, long, quantity)
    point = [lat, long]
    @flights = Flight.geo_near(point).max_distance(5).take(quantity)
    
  end

  def find_lat_long
    render json: find_lat_long_data(params[:lat].to_f, params[:long].to_f, params[:quantity].to_i)
  end

  def map
    @flights = find_lat_long_data(38.964022,-77.378791, 10)
    render "map"
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(params[:flight])

    if @flight.save
      render json: @flight, status: :created, location: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    @flight = Flight.find(params[:id])

    if @flight.update(params[:flight])
      head :no_content
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy

    head :no_content
  end
end
