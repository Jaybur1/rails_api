module Api
  module V1
    class AuthenticationController < ApplicationController
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
      def create
        params.require(:username)
        params.require(:password)
        render json: { token: '123' }, status: :created
      end

      private
      def user_params
        params.require(:user).permit(:username, :password)
      end

      def parameter_missing(e)
        render json: { error: e.message.split("\n")[0] }, status: :unprocessable_entity
      end
    end
  end
end