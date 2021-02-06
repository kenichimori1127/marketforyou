class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer    :user_id
      t.integer    :staff_id
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
