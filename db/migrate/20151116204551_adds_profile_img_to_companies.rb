class AddsProfileImgToCompanies < ActiveRecord::Migration
  def change
    add_attachment :companies, :profile_img
  end
end
