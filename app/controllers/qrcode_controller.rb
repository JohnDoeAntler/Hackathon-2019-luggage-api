class QrcodeController < ApplicationController
	before_action :set_user, only: [:generate, :auth]
  	SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

	def generate
		render json: { token: JsonWebToken.encode(id: @user.id) }
	end

	def auth
		begin
			@decoded = JsonWebToken.decode(params[:token])
			render json: { validation: true }
		rescue ActiveRecord::RecordNotFound => e
			render json: { errors: e.message }, status: :unauthorized
		rescue JWT::DecodeError => e
			render json: { validation: false }, status: :unauthorized
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find(params[:id])
	end
end
