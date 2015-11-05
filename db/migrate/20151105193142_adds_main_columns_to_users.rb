class AddsMainColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
    add_column :users, :country, :string
    add_column :users, :web, :string
    add_column :users, :linkedin, :string
    add_column :users, :twitter, :string
  end
end
