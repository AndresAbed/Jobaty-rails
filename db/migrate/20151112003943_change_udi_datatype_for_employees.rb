class ChangeUdiDatatypeForEmployees < ActiveRecord::Migration
  def change
    change_column :employees, :uid, :string
  end
end
