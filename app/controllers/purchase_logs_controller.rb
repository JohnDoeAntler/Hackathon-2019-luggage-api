class PurchaseLogsController < ApplicationController
  before_action :set_purchase_log, only: [:show, :update, :destroy]

  # GET /purchase_logs
  def index
    @purchase_logs = PurchaseLog.where(purchase_log_params).all

    render json: @purchase_logs
  end

  # GET /purchase_logs/1
  def show
    render json: @purchase_log
  end

  # POST /purchase_logs
  def create
    @purchase_log = PurchaseLog.new(purchase_log_params)

    if @purchase_log.save
      render json: @purchase_log, status: :created, location: @purchase_log
    else
      render json: @purchase_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /purchase_logs/1
  def update
    if @purchase_log.update(purchase_log_params)
      render json: @purchase_log
    else
      render json: @purchase_log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /purchase_logs/1
  def destroy
    @purchase_log.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_log
      @purchase_log = PurchaseLog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_log_params
      params.permit(:user_id, :store_id, :space_increasement)
    end
end