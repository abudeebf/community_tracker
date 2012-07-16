class AddEndDateToPastevent < ActiveRecord::Migration
  def change
    add_column :pastevents, :end_date, :datetime
  end
end
