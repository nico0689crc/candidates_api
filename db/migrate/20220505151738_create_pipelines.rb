class CreatePipelines < ActiveRecord::Migration[7.0]
  def change
    create_table :pipelines do |t|
      t.string :title
      t.text :description
      t.integer :order, null: false
      t.references :job, null: false, foreign_key: true
      t.references :attendant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
