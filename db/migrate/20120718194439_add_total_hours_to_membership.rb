class AddTotalHoursToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :total_hours, :integer
  end
end
