class CreateWorkspaces < ActiveRecord::Migration[6.0]
  def change
    create_table :workspaces do |t|
      t.string :address
      t.string :description
      t.integer :price
      t.integer :seats
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
