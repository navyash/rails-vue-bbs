module Api
  module V1
    class TopicsController < ApplicationController
      def index
        topics = Topic.order('created_at desc')
        render json: {status: 'SUCCESS', message: 'Loaded topics', data: topics}, status: :ok
      end

      def show
        # topic = Topic.find(params[:id])
        topic = Topic.joins(:comments).where(id: params[:id]).select('topics.*, comments.*')
        render json: {status: 'SUCCESS', message: 'Loaded topic', data: topic}, status: :ok
      end

      def create
        topic = Topic.new(topic_params)

        if topic.save
          render json: {status: 'SUCCESS', message: 'Saved topic', data: topic}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Topic not saved', data: topic.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        topic = Topic.find(params[:id])
        topic.destroy
        render json: {status: 'SECCESS', message: 'Deleted topic', data: topic}, status: :ok
      end

      def update
        topic = Topic.find(params[:id])

        if topic.update_attributes(topic_params)
          render json: {status: 'SUCCESS', message: 'Updated topic', data: topic}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Topic not updated', data: topic.errors}, status: :unprocessable_entity
        end
      end

      private

      def topic_params
        params.permit(:title, :body, category_ids: [])
      end
    end
  end
end