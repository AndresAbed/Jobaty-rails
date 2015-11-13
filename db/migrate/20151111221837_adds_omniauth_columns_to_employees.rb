class AddsOmniauthColumnsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :provider, :string
    add_column :employees, :uid, :string
    add_column :employees, :oauth_token :string
  end
end
