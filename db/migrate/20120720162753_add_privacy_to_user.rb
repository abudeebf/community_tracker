class AddPrivacyToUser < ActiveRecord::Migration
  def change
    add_column :users, :privacy, :boolean
  end
end
