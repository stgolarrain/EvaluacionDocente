class Course < ActiveRecord::Base
  belongs_to :academic_unit
  belongs_to :teacher
  belongs_to :semester

  validates :acronym,     	:presence => true
  validates :name   ,     	:presence => true
  validates :semester,    	:presence => true
  validates :academic_unit, :presence => true
  validates_uniqueness_of :acronym, :scope => :semester_id

end
