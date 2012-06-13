class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.datetime :starttime
      t.datetime :endtime
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
