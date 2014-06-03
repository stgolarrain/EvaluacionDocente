class Course < ActiveRecord::Base
  belongs_to :academic_unit
  belongs_to :teacher
  belongs_to :semester

  has_and_belongs_to_many :campus

  validates :acronym,     :presence => true
  validates :name   ,     :presence => true
  validates :semester,    :presence => true
  validates_uniqueness_of :acronym, :scope => :semester_id

end
