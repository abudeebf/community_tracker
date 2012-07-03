class AddPhoneToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :phone, :long
  end
end
