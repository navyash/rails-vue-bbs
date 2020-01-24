class CreateTopicCategories < ActiveRecord::Migration[5.2]
  def change
    options = {
      :force => true,
      :options => "ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"
    }
    create_table(:topic_categories, options) do |t|
      t.references :topic, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
