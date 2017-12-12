class CreatePockets < ActiveRecord::Migration[5.1]
  def change
    create_table :pockets do |t|
      t.timestamps
    end
  end
end
