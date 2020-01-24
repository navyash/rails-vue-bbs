module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        user = current_api_v1_user
        render json: {status: 'SUCCESS', message: 'UserInfo get', data: user}, status: :ok
      end
    end
  end
end