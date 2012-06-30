class AddAttendToPaticipations < ActiveRecord::Migration
  def change
    add_column :participations, :attend, :boolean
  end
end
