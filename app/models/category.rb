class Category < ApplicationRecord
  has_many :topic_categories
  has_many :topics, through: :topic_categories
  accepts_nested_attributes_for :topic_categories
end
