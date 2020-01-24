module Api
  module V1
    class SearchController < ApplicationController
      def show
        topic = Topic.eager_load(:comments).where("title LIKE :word OR comments.content LIKE :word", word: "%#{params[:word]}%").select('topics.*, comments.*')

        render json: {status: 'SUCCESS', message: 'Loaded topic', data: topic}, status: :ok
      end
    end
  end
end