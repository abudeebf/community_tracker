class AddLatitudeGroup < ActiveRecord::Migration
  def up
  	add_column :groups, :latitude, :float
  end

  def down
  end
end
