class CreateJobExperiences < ActiveRecord::Migration
  def change
    create_table :job_experiences do |t|
      t.string :title
      t.string :company
      t.date :since
      t.date :until
      t.string :description
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
