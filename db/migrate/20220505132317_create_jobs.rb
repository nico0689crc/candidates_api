class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
