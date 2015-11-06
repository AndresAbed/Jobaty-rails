class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :name
      t.string :institution
      t.date :since
      t.date :until
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
