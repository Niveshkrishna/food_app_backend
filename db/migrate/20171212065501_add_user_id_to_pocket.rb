class AddUserIdToPocket < ActiveRecord::Migration[5.1]
  def change
    add_column :pockets, :user_id, :integer
  end
end
