class AddUserIdToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :user_id, :integer
  	add_index  :groups,[:user_id,:created_at]
  end
end
