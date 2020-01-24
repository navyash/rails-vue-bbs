module Api
  module V1
    class TopicCategoriesController < ApplicationController
      def show
        topiccategory = TopicCategory.joins(:category).where(topic_id: params[:topic_id]).select('categories.id, categories.name')
        render json: {status: 'SUCCESS', message: 'Loaded topic', data: topiccategory}, status: :ok
      end
    end
  end
end