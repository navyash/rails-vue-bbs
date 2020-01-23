class CreateTopicCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_categories do |t|
      t.references :topic, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
