class AddUrlTokenToJobsApplicant < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs_applicants, :url_token, :string, null: false
  end
end
