class AddTokenToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :token, :string, unique: true, null: false
  end
end
