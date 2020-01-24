class CreateComments < ActiveRecord::Migration[5.2]
  def change
    options = {
      :force => true,
      :options => "ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"
    }
    create_table(:comments, options) do |t|
      t.references :topic, foreign_key: true
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
