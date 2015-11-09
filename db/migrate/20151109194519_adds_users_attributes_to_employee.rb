class AddsUsersAttributesToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :name, :string
    add_column :employees, :address, :string
    add_column :employees, :city, :string
    add_column :employees, :province, :string
    add_column :employees, :country, :string
    add_column :employees, :web, :string
    add_column :employees, :linkedin, :string
    add_column :employees, :twitter, :string
  end
end
