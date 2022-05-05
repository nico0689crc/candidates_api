class AddFeedbackToJobsApplicantsPipeline < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs_applicants_pipelines, :feedback, :string
  end
end
