class AddCommentToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :comment, :text
  end
end
