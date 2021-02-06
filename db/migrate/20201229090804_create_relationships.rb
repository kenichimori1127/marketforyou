class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :user,      foreign_key: true
      t.references :staff,     foreign_key: true
      t.boolean    :user_type, default: 0
      t.timestamps
    end
  end
end
