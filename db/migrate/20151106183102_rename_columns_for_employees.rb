class RenameColumnsForEmployees < ActiveRecord::Migration
  def change
    rename_column :employees, :birthdate, :birth_date
    rename_column :employees, :job_type_string, :job_type
  end
end
