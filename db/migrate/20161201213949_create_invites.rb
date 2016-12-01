class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :event_id
      t.integer :invitee_id

      t.timestamps

    end
  end
end
