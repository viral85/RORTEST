class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :name
      t.text :comment
      t.boolean :completed

      t.timestamps
    end
  end
end
