class AirplanesController < ApplicationController
  before_action :set_airplane, only: [:show, :update, :destroy]

  # GET /airplanes
  def index
    @airplanes = Airplane.all

    render json: @airplanes, include: [:airplane_classes, :flights]
  end

  # GET /airplanes/1
  def show
    render json: @airplane, include: [:airplane_classes, :flights]
  end

  # POST /airplanes
  def create
    @airplane = Airplane.new(airplane_params)

    if @airplane.save
      render json: @airplane, status: :created, location: @airplane
    else
      render json: @airplane.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /airplanes/1
  def update
    if @airplane.update(airplane_params)
      render json: @airplane
    else
      render json: @airplane.errors, status: :unprocessable_entity
    end
  end

  # DELETE /airplanes/1
  def destroy
    @airplane.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airplane
      @airplane = Airplane.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def airplane_params
      params.fetch(:airplane, {})
    end
end
