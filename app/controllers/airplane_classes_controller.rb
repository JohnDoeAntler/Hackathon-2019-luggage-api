class AirplaneClassesController < ApplicationController
  before_action :set_airplane_class, only: [:show, :update, :destroy]

  # GET /airplane_classes
  def index
    @airplane_classes = AirplaneClass.where(airplane_class_params).all

    render json: @airplane_classes, include: :users
  end

  # GET /airplane_classes/1
  def show
    render json: @airplane_class, include: :users
  end

  # POST /airplane_classes
  def create
    @airplane_class = AirplaneClass.new(airplane_class_params)

    if @airplane_class.save
      render json: @airplane_class, status: :created, location: @airplane_class
    else
      render json: @airplane_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /airplane_classes/1
  def update
    if @airplane_class.update(airplane_class_params)
      render json: @airplane_class
    else
      render json: @airplane_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /airplane_classes/1
  def destroy
    @airplane_class.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airplane_class
      @airplane_class = AirplaneClass.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def airplane_class_params
      params.permit(:airplane_id, :cot, :seat_amount, :seat_col, :seat_row, :bin_amount, :bin_col, :bin_row, :bin_length, :bin_width, :bin_height, :assignable_space_percentage, :purchasable_space_percentage)
    end
end
