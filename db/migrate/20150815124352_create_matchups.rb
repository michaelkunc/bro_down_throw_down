class CreateMatchups < ActiveRecord::Migration

  def change
    create_table :matchups do |t|
      t.references :challenger
      t.references :challengee
      t.timestamps
    end
  end


end
