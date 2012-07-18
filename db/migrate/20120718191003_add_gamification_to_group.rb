class AddGamificationToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :gamification, :boolean
    add_column :groups, :gold, :integer
    add_column :groups, :silver, :integer
    add_column :groups, :bronze, :integer
  end
end
