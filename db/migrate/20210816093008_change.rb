class Change < ActiveRecord::Migration[6.1]
  def change
    rename_column :notes, :users_id, :user_id
  end
end
