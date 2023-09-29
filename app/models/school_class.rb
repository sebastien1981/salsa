class SchoolClass < ApplicationRecord
  belongs_to :school
  has_many :schools_class_teachers
  has_many :teachers, through: :school_class_teachers
  has_many :school_class_type_of_dances
  has_many :type_of_dances, through: :school_class_type_of_dances
  has_many :school_class_levels
  has_many :levels, through: :school_class_levels
end
