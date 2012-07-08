class AddAddressGroup < ActiveRecord::Migration
  def up
  	add_column :groups, :address, :string
  end

  def down
  end
end
