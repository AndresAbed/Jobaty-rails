class CreateInterestedJobs < ActiveRecord::Migration
  def change
    create_table :interested_jobs do |t|
      t.string :job
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
