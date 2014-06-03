class Course < ActiveRecord::Base
  belongs_to :academic_unit
  belongs_to :teacher

  has_and_belongs_to_many :campus
end
