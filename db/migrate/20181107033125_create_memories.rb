class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.text :description
      t.string :city
      t.float :temperature
      t.float :lat
      t.float :long
      t.datetime :day

      t.timestamps
    end
  end
end
