class AddRecurringEndsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :recurring_ends, :datetime
  end
end
