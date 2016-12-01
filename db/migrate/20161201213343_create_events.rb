class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :host_id
      t.datetime :start

      t.timestamps

    end
  end
end
