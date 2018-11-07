class AddWeatherToMemories < ActiveRecord::Migration[5.2]
  def change
    add_reference :memories, :weather, foreign_key: true
  end
end
