class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :position
      t.belongs_to :stage, null: false, foreign_key: true
      t.belongs_to :procedure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
