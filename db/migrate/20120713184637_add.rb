class Add < ActiveRecord::Migration
  def change
		add_column :pastevents, :token, :string 
	end

  def down
  end
end
