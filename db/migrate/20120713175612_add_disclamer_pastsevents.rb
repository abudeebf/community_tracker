class AddDisclamerPastsevents < ActiveRecord::Migration
	def change
		add_column :pastevents, :disclamer, :boolean 
	end

 
end
