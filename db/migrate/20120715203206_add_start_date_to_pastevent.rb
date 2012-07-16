class AddStartDateToPastevent < ActiveRecord::Migration
  def change
    add_column :pastevents, :start_date, :datetime
  end
end