class AddsProfileCompletedToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :profile_completed, :boolean
  end
end
