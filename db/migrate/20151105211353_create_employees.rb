class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :last_name
      t.date :birthdate
      t.integer :phone
      t.string :gender
      t.integer :salary
      t.string :remote
      t.string :job_type_string

      t.timestamps null: false
    end
  end
end
