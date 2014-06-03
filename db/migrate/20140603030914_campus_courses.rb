class CampusCourses < ActiveRecord::Migration
  def change
  	create_table :campus_courses, :id => false do |t|
  		t.column :campu_id, :integer
  		t.column :course_id, :integer
  	end
  end
end
