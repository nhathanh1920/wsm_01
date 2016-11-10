class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :column
      t.integer :row
      t.string :desk_code
      t.integer :status
      t.text :description
      t.references :workspace, foreign_key: true

      t.timestamps
    end
  end
end
