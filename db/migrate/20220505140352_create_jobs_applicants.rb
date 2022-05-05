class CreateJobsApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs_applicants do |t|
      t.belongs_to :job, foreign_key: true
      t.belongs_to :applicant, foreign_key: true
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
