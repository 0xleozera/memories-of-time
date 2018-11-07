class AddUserToMemories < ActiveRecord::Migration[5.2]
  def change
    add_reference :memories, :user, foreign_key: true
  end
end
