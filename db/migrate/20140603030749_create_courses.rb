class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :acronym
      t.string :status
      t.string :requirement
      t.string :description
      t.string :syllabus
      t.string :web_page
      t.references :academic_unit, index: true
      t.references :teacher, index: true
      t.references :semester, index: true

      t.timestamps
    end
  end
end
