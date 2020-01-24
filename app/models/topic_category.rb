class TopicCategory < ApplicationRecord
  belongs_to :topic
  belongs_to :category
  def to_param
    topic_id
  end
end
