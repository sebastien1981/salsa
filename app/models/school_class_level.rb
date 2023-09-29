class SchoolClassLevel < ApplicationRecord
  belongs_to :level
  belongs_to :school_class
end
