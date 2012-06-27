class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id
      t.integer :event_id
      t.boolean :approval

      t.timestamps
    end
  end
end
