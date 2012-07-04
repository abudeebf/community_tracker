class CreateReflections < ActiveRecord::Migration
  def change
    create_table :reflections do |t|
      t.integer :r_id
      t.text :u_reflection

      t.timestamps
    end
  end
end
