require 'test_helper'

class FlightsControllerTest < ActionController::TestCase
  setup do
    @flight = flights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flights)
  end

  test "should create flight" do
    assert_difference('Flight.count') do
      post :create, flight: { aircraft: @flight.aircraft, altitude: @flight.altitude, destination: @flight.destination, flightnum: @flight.flightnum, lat: @flight.lat, long: @flight.long, origin: @flight.origin, registration: @flight.registration, speed: @flight.speed }
    end

    assert_response 201
  end

  test "should show flight" do
    get :show, id: @flight
    assert_response :success
  end

  test "should update flight" do
    put :update, id: @flight, flight: { aircraft: @flight.aircraft, altitude: @flight.altitude, destination: @flight.destination, flightnum: @flight.flightnum, lat: @flight.lat, long: @flight.long, origin: @flight.origin, registration: @flight.registration, speed: @flight.speed }
    assert_response 204
  end

  test "should destroy flight" do
    assert_difference('Flight.count', -1) do
      delete :destroy, id: @flight
    end

    assert_response 204
  end
end
