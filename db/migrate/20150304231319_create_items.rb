class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :name
      t.datetime :due_at

      t.timestamps null: false
    end

    add_index :items, :list_id
  end
end
