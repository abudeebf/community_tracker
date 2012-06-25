class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :invited_members
      t.datetime :sent_at
      t.integer :sender_id

      t.timestamps
    end
  end
end
