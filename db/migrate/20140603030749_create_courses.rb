class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :acronym
      t.references :academic_unit, index: true
      t.references :teacher, index: true
      t.string :semester_references

      t.timestamps
    end
  end
end
