class AuthController < ApplicationController
  def store
    @store = Store.find_by_username(params[:username])
    if @store&.authenticate(params[:password])
      token = JsonWebToken.encode(store_id: @store.id)
      time = Time.now + 24.hours.to_i
      render json: {
        id: @store.id,
        token: token,
        exp: time.strftime("%m-%d-%Y %H:%M")
      }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def staff
    @staff = Staff.find_by_username(params[:username])
    if @staff&.authenticate(params[:password])
      token = JsonWebToken.encode(staff_id: @staff.id)
      time = Time.now + 24.hours.to_i
      render json: {
        id: @staff.id,
        token: token,
        exp: time.strftime("%m-%d-%Y %H:%M")
      }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
