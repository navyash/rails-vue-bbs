class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    options = {
      :force => true,
      :options => "ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"
    }
    create_table(:categories, options) do |t|
      t.string :name

      t.timestamps
    end
  end
end
