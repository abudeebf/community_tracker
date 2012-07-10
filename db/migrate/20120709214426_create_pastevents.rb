class CreatePastevents < ActiveRecord::Migration
  def change
    create_table :pastevents do |t|
      t.integer :user_id
      t.string :orgname
      t.string :location
      t.float :hours
      t.string :adminname
      t.string :email
      t.boolean :approval

      t.timestamps
    end
  end
end
