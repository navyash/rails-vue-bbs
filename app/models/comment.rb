class Comment < ApplicationRecord
  belongs_to :topic
  def to_param
    topic_id
  end
end
