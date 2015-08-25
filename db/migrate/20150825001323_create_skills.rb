class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :user
      t.references :style
    end
  end
end
