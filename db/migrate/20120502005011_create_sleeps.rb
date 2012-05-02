class CreateSleeps < ActiveRecord::Migration
  def change
    create_table :sleeps do |t|
      t.date :day_of_sleep
      t.datetime :start_time
      t.datetime :wake_time
      t.text :note

      t.timestamps
    end
  end
end
