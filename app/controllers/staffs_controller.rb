class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :update, :destroy]

  # GET /staffs
  def index
    @staffs = Staff.where(staff_params).all

    render json: @staffs, except: [:username, :password_digest]
  end

  # GET /staffs/1
  def show
    render json: @staff, except: [:uesrname, :password_digest]
  end

  # POST /staffs
  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      render json: @staff, status: :created, location: @staff
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /staffs/1
  def update
    if @staff.update(staff_params)
      render json: @staff
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  # DELETE /staffs/1
  def destroy
    @staff.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def staff_params
      params.permit(:username, :password, :role)
    end
end
