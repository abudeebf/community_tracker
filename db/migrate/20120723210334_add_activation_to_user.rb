class AddActivationToUser < ActiveRecord::Migration
  def change
    add_column :users, :confirmation, :boolean
  end
end
