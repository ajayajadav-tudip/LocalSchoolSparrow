class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :SchoolName
      t.string :School_Location
      t.string :Student_Capacity
      t.string :Email_Id

      t.timestamps null: false
    end
  end
end
