class CreateMatchups < ActiveRecord::Migration

  def change
    create_table :matchups do |t|
      t.integer :challenger_id
      t.integer :challengee_id
      t.timestamps
    end
  end


end
