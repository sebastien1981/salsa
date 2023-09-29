class Level < ApplicationRecord
  has_many :school_class_levels
  has_many :school_classes, through: :school_class_levels
end
