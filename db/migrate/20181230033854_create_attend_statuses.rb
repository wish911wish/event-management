class CreateAttendStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :attend_statuses do |t|
      t.references    :user, foreign_key: true
      t.references    :event, foreign_key: true
      t.integer       :attend
      t.timestamps
    end
  end
end
