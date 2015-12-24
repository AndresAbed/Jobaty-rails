class AddsProfileCompletedToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :profile_completed, :boolean
  end
end
