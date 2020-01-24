class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    options = {
      :force => true,
      :options => "ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"
    }
    create_table(:topics, options) do |t|
      t.string :title

      t.timestamps
    end
  end
end
