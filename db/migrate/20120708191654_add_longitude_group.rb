class AddLongitudeGroup < ActiveRecord::Migration
  def up
  	add_column :groups, :longitude, :float
  end

  def down
  end
end
