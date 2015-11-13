class AddsNewColumnsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :name, :string
    add_column :companies, :address, :string
    add_column :companies, :city, :string
    add_column :companies, :province, :string
    add_column :companies, :country, :string
    add_column :companies, :web, :string
    add_column :companies, :facebook, :string
    add_column :companies, :linkedin, :string
    add_column :companies, :twitter, :string
    add_column :companies, :other_web, :string
  end
end
