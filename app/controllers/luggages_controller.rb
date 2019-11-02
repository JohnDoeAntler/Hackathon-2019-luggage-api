class LuggagesController < ApplicationController
  before_action :set_luggage, only: [:show, :update, :destroy]

  # GET /luggages
  def index
    @luggages = Luggage.where(luggage_params).all

    render json: @luggages
  end

  # GET /luggages/1
  def show
    render json: @luggage
  end

  # POST /luggages
  def create
    @luggage = Luggage.new(luggage_params)

    if @luggage.save
      render json: @luggage, status: :created, location: @luggage
    else
      render json: @luggage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /luggages/1
  def update
    if @luggage.update(luggage_params)
      render json: @luggage
    else
      render json: @luggage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /luggages/1
  def destroy
    @luggage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_luggage
      @luggage = Luggage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def luggage_params
      params.permit(:user_id, :length, :width, :height, :image_url, :space_index)
    end
end
