class RenameAvatarColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :avatar, :image
  end
end
