class SchoolClass < ApplicationRecord
  belongs_to :school
  has_many :schools_class_teachers
  has_many :teachers, through: :school_class_teachers
end
