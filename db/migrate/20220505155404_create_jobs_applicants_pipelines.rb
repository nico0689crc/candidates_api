class CreateJobsApplicantsPipelines < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs_applicants_pipelines do |t|
      t.references :jobs_applicant, null: false, foreign_key: true
      t.references :pipeline, null: false, foreign_key: true
      t.boolean :passed, null: false, default: false

      t.timestamps
    end
  end
end
