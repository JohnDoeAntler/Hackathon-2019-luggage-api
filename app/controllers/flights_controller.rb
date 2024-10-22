class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :update, :destroy]

  # GET /flights
  def index
    @flights = Flight.where(flight_params).all

    render json: @flights, include: :users
  end

  # GET /flights/1
  def show
    render json: @flight, include: :users
  end

  # POST /flights
  def create
    @flight = Flight.new(flight_params)

    if @flight.save
      render json: @flight, status: :created, location: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flights/1
  def update
    if @flight.update(flight_params)
      render json: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # DELETE /flights/1
  def destroy
    @flight.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flight_params
      params.permit(:airplane_id)
    end
end
