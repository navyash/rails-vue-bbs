class Topic < ApplicationRecord
  has_many :topic_categories
  has_many :categories, through: :topic_categories
  has_many :comments
end
