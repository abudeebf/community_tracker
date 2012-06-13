class CreateBranchtests < ActiveRecord::Migration
  def change
    create_table :branchtests do |t|
      t.string :name
      t.string :branch

      t.timestamps
    end
  end
end
