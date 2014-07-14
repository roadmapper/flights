class FlightsController < ApplicationController
  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all.first

    render json: @flights
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
    @flight = Flight.find(params[:id])

    render json: @flight
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
