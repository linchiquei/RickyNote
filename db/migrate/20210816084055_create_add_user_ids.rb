class CreateAddUserIds < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :users, foreign_key: true
    end
  end
end
