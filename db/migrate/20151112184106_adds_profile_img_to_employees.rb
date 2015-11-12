class AddsProfileImgToEmployees < ActiveRecord::Migration
  def change
    add_attachment :employees, :profile_img
  end
end
