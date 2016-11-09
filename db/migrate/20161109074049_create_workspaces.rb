class CreateWorkspaces < ActiveRecord::Migration[5.0]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.integer :number_of_columns
      t.integer :number_of_rows
      t.text :description

      t.timestamps
    end
  end
end
