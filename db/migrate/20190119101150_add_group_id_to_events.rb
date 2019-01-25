class AddGroupIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :group, foreign_key: true
  end
end
