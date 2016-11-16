class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :abbreviation
      t.text :description
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
