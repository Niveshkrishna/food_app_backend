class CreateInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table :instructions do |t|
      t.string :content
      t.integer :recipe_id
      t.integer :serial_number

      t.timestamps
    end
  end
end
