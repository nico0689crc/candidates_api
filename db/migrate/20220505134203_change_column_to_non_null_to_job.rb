class ChangeColumnToNonNullToJob < ActiveRecord::Migration[7.0]
  def change
    change_column_null :jobs, :title, false
    change_column_null :jobs, :description, false
    change_column_null :jobs, :active, false
  end
end
