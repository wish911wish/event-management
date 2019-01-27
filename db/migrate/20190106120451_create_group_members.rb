class CreateGroupMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_members do |t|
      t.references    :user, foreign_key: true
      t.references    :group, foreign_key: true
      t.timestamps
    end
  end
  add_index :group_members, [:user, :group], unique: true
end
