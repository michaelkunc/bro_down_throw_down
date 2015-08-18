class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|

      t.integer :challenger_id
      t.integer :challenged_id

      t.timestamps null: false
    end
  add_index :relationships, :challenger_id
  add_index :relationships, :challenged_id
  add_index :relationships, [:challenger_id, :challenged_id], unique: true
  end

end
