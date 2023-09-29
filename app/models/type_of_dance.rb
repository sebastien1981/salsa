class TypeOfDance < ApplicationRecord
  has_many :school_class_type_of_dances
  has_many :type_of_dances, through: :school_class_type_of_dances
end
