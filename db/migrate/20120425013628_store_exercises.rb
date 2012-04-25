class StoreExercises < ActiveRecord::Migration
  def up
    create_table :exercises do |t|
      t.string :name
      t.text :instructions
      t.timestamps
    end
  end

  def down
    drop_table :exercises
  end
end
