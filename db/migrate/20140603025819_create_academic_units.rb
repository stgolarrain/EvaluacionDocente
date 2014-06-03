class CreateAcademicUnits < ActiveRecord::Migration
  def change
    create_table :academic_units do |t|
      t.string :name

      t.timestamps
    end
  end
end
