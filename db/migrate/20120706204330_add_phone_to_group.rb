class AddPhoneToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :phone, :string
  end
end
