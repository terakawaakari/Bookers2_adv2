class CreateAddUserToGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :add_user_to_groups do |t|
      t.integer :user_id
      t.integer :group_id
      t.boolean :activation, default: false, null: false

      t.timestamps
    end
  end
end
